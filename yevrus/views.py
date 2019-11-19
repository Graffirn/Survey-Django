import requests

from django.conf import settings
from django.core.mail import EmailMessage
from django.urls import reverse
from django.forms import formset_factory, BaseFormSet
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_text
from django.shortcuts import render, get_object_or_404, redirect, get_list_or_404
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth import login, authenticate, logout, update_session_auth_hash
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib import messages
from datetime import datetime

from .models import *
from .forms import *
from .tokens import account_activation_token


def log_in(request):
    if request.user.is_authenticated:
        return redirect('yevrus:dashboard')

    if request.method == 'POST':
        form = UserLoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('yevrus:dashboard')
            else:
                return render(request, 'yevrus/login.html', {'form': form, 'user': user})
    else:
        form = UserLoginForm()
    context = {'form': form}
    return render(request, 'yevrus/login.html', context)


def log_out(request):
    logout(request)
    return redirect('yevrus:login')


def register(request):
    if request.user.is_authenticated:
        return redirect('yevrus:dashboard')

    if request.method == 'POST':
        form = SignupForm(request.POST)
        if form.is_valid():
            recaptcha_response = request.POST.get('g-recaptcha-response')
            data = {
                'secret': settings.GOOGLE_RECAPTCHA_SECRET_KEY,
                'response': recaptcha_response
            }
            r = requests.post('https://www.google.com/recaptcha/api/siteverify', data=data)
            result = r.json()

            if result['success']:
                user = form.save(commit=False)
                user.is_active = False
                user.save()
                current_site = get_current_site(request)
                mail_subject = 'Activate your account.'
                message = render_to_string('yevrus/account_active_email.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'token': account_activation_token.make_token(user),
                })
                to_email = form.cleaned_data.get('email')
                email = EmailMessage(mail_subject, message, to=[to_email])
                email.send()
                messages.success(request, 'An activation link has been sent to your email address.' \
                                          'Please Check your Inbox to confirm before login.')
                return redirect('yevrus:login')
            else:
                messages.error(request, 'Invalid reCAPTCHA. Please try again.')
    else:
        form = SignupForm()

    context = {'form': form}
    return render(request, 'yevrus/register.html', context)


def activate(request, uidb64, token, backend='django.contrib.auth.backends.ModelBackend'):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user, backend='django.contrib.auth.backends.ModelBackend')
        messages.success(request, 'Thank you for your email confirmation. Now you have logged In')
        return redirect('yevrus:dashboard')
    else:
        messages.error(request, 'Activation link is invalid!')
        return redirect('yevrus:login')


@login_required(login_url='/yevrus/')
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'Your password was successfully updated!')
            return redirect('yevrus:dashboard')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'yevrus/change_password.html', {'form': form})


@login_required(login_url='/yevrus/')
def dashboard(request):
    user = request.user
    latest_survey_list = Survey.objects.exclude(user=user).exclude(is_published=0)
    response_list = Response.objects.filter(user=user).values('survey').distinct()
    filled_survey_list = Survey.objects.filter(id__in=response_list)
    context = {
        'latest_survey_list': latest_survey_list,
        'filled_survey_list': filled_survey_list,
    }
    return render(request, 'yevrus/dashboard.html', context)


@login_required(login_url='/yevrus/')
def mysurveys(request):
    user = request.user
    publish_survey_list = Survey.objects.filter(user=user, is_published=1, is_done=False)
    private_survey_list = Survey.objects.filter(user=user, is_published=0, is_done=False)
    done_survey_list = Survey.objects.filter(user=user, is_done=True)
    response_list = Response.objects.filter(user=user).values('survey').distinct()
    filled_survey_list = Survey.objects.filter(id__in=response_list)
    context = {
        'publish_survey_list': publish_survey_list,
        'private_survey_list': private_survey_list,
        'filled_survey_list': filled_survey_list,
        'done_survey_list': done_survey_list,
    }
    if not publish_survey_list and not private_survey_list and not done_survey_list and not filled_survey_list:
        context['is_empty'] = True
    return render(request, 'yevrus/my_surveys.html', context)


@login_required(login_url='/yevrus/')
def createsurveys(request):
    if request.method == 'POST':
        user = request.user
        survey = user.survey_set.create(title=request.POST.get('title'), is_published=request.POST.get('is_published'))
        try:
            survey.save()
            question_count = int(request.POST.get('question_count'))
            for i in range(0, question_count):
                question_id = request.POST.get('question_%s[id_in_survey]' % i)
                question_type = request.POST.get('question_%s[type]' % i)
                question_text = request.POST.get('question_%s[text]' % i)
                question_option = request.POST.get('question_%s[option]' % i).split('\n')
                question = survey.question_set.create(id_in_survey=question_id, type=question_type, title=question_text)
                question.save()
                if question_type != '0':
                    for j, option in enumerate(question_option):
                        choice = question.choice_set.create(label=option, id_in_question=j)
                        choice.save()
        except:
            survey.delete()
            return JsonResponse({'message': 'An error occur. Please try a gain.'})
        return JsonResponse({'message': 'Success!'})
    else:
        return render(request, 'yevrus/create_surveys.html')


@login_required(login_url='/yevrus/')
def editsurvey(request, survey_key):
    survey = get_object_or_404(Survey, key=survey_key)
    questions_set = survey.question_set.all().order_by('id_in_survey')

    if request.method == 'POST':
        survey.delete()
        user = request.user
        survey = user.survey_set.create(title=request.POST.get('title'), is_published=request.POST.get('is_published'),
                                        key=survey_key)
        try:
            survey.save()
            question_count = int(request.POST.get('question_count'))
            for i in range(0, question_count):
                question_id = request.POST.get('question_%s[id_in_survey]' % i)
                question_type = request.POST.get('question_%s[type]' % i)
                question_text = request.POST.get('question_%s[text]' % i)
                question_option = request.POST.get('question_%s[option]' % i).split('\n')
                question = survey.question_set.create(id_in_survey=question_id, type=question_type, title=question_text)
                question.save()
                if question_type != '0':
                    for j, option in enumerate(question_option):
                        choice = question.choice_set.create(label=option, id_in_question=j)
                        choice.save()
        except:
            survey.delete()
            return JsonResponse({'message': 'An error occur. Please try a gain.'})
        return JsonResponse({'message': 'Success!'})
    else:
        context = {'title': survey.title,
                   'is_published': "checked" if survey.is_published is True else "",
                   'questions': [],
                   'question_id': len(questions_set),
                   'list_question_id': [i for i in range(0, len(questions_set))],
                   'key': survey_key
                   }
        for i, question in enumerate(questions_set):
            question_type = question.type
            question_title = question.title
            question_html = ""
            if question_type != '0':
                question_options = "\n".join(
                    choice.label for choice in question.choice_set.all().order_by('id_in_question'))
                if question_type == '1':
                    question_html = render_to_string('yevrus/radio_question.html', {
                        'questionId': i,
                        'text': question_title,
                        'options': question_options
                    })
                elif question_type == '2':
                    question_html = render_to_string('yevrus/multichoice_question.html', {
                        'questionId': i,
                        'text': question_title,
                        'options': question_options
                    })
            else:
                question_html = render_to_string('yevrus/text_question.html', {
                    'questionId': i,
                    'text': question_title
                })
            context['questions'].append(question_html)
        return render(request, 'yevrus/editsurvey.html', context)


@login_required(login_url='/yevrus/')
def deletesurvey(request, survey_key):
    survey = get_object_or_404(Survey, key=survey_key)
    survey.delete()
    messages.success(request, 'Delete successfully.')
    return redirect('yevrus:mysurveys')


@login_required(login_url='/yevrus/')
def surveyresponse(request, survey_key):
    user = request.user
    survey = get_object_or_404(Survey, key=survey_key)
    context = {'title': survey.title,
               'key': survey.key}

    if request.method == 'POST':
        form = SurveyForm(request.POST, survey=survey)

        if form.is_valid():
            survey_response = Response(survey=survey, user=user)
            try:
                survey_response.save()
                questions_set = survey.question_set.all().order_by('id_in_survey')
                for i, question in enumerate(questions_set):
                    answer_text = form.cleaned_data['question_%s' % i]
                    answer = survey_response.answer_set.create(id_in_response=i, type=question.type, answer=answer_text)
                    answer.save()
                messages.success(request, 'Submit form successfully')
                return redirect('yevrus:dashboard')
            except:
                survey_response.delete()
                messages.error(request, 'Error occur. Please try again')
    form = SurveyForm(survey=survey)
    context['form'] = form
    return render(request, 'yevrus/survey_response.html', context)


@login_required(login_url='/yevrus/')
def show_response(request, survey_key):
    survey = get_object_or_404(Survey, key=survey_key)
    context = {'key': survey_key}
    form = ResponseForm(user=request.user, survey=survey)
    context['form'] = form
    context['title'] = survey.title
    last_location = request.META.get('HTTP_REFERER')
    if last_location:
        context['last_location'] = last_location
    return render(request, 'yevrus/show_response.html', context)


@login_required(login_url='/yevrus/')
def get_result(request, survey_key):
    survey = get_object_or_404(Survey, key=survey_key)
    response_set = survey.response_set.all().order_by('submit_date')
    if request.method == 'POST':
        context = {'key': survey_key}
        for i, response in enumerate(response_set):
            response_info = {'id': response.id, 'user': response.user.username}
            context[str(i)] = response_info
        return JsonResponse(context)
    else:
        return redirect('yevrus:dashboard')


@login_required(login_url='/yevrus/')
def show_response_id(request, survey_key, response_id):
    survey = get_object_or_404(Survey, key=survey_key)
    context = {'key': survey_key}
    form = ResponseForm(response_id=response_id, survey=survey)
    context['form'] = form
    context['title'] = survey.title
    last_location = request.META.get('HTTP_REFERER')
    if last_location:
        context['last_location'] = last_location
    return render(request, 'yevrus/show_response.html', context)


@login_required(login_url='/yevrus/')
def publish_survey(request, survey_key):
    survey = get_object_or_404(Survey, key=survey_key)
    survey.publish()
    survey.save()
    return redirect('yevrus:mysurveys')


@login_required(login_url='/yevrus/')
def archive_survey(request, survey_key):
    survey = get_object_or_404(Survey, key=survey_key)
    survey.change_archive_status()
    survey.save()
    return redirect('yevrus:mysurveys')
