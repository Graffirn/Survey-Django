import datetime
import ast
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class SignupForm(UserCreationForm):
    email = forms.EmailField(max_length=200, help_text='Required')

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')


class UserLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class SurveyForm(forms.Form):

    def __init__(self, *args, **kwargs):
        survey = kwargs.pop('survey')
        super(SurveyForm, self).__init__(*args, **kwargs)
        questions_set = survey.question_set.all().order_by('id_in_survey')

        for i, question in enumerate(questions_set):
            if question.type == '0':
                self.fields['question_%s' % i] = forms.CharField(label=question.title, widget=forms.TextInput(
                    attrs={'class': 'form-control'}))
            if question.type == '1':
                choice_set = question.choice_set.all().order_by('id_in_question')
                options = [(c.id_in_question, c.label) for c in choice_set]
                self.fields['question_%s' % i] = forms.ChoiceField(choices=options, widget=forms.RadioSelect,
                                                                   label=question.title)
            if question.type == '2':
                choice_set = question.choice_set.all().order_by('id_in_question')
                options = [(c.id_in_question, c.label) for c in choice_set]
                self.fields['question_%s' % i] = forms.MultipleChoiceField(choices=options,
                                                                           required=False, label=question.title,
                                                                           widget=forms.CheckboxSelectMultiple)


class ResponseForm(forms.Form):
    def __init__(self, *args, **kwargs):
        response = None
        survey = kwargs.pop('survey')
        if 'user' in kwargs:
            user = kwargs.pop('user')
            response = survey.response_set.get(user=user)

        elif 'response_id' in kwargs:
            response_id = kwargs.pop('response_id')
            response = survey.response_set.get(id=response_id)

        super(ResponseForm, self).__init__(*args, **kwargs)
        questions_set = survey.question_set.all().order_by('id_in_survey')
        answer = response.answer_set.all().order_by('id_in_response')
        for i, question in enumerate(questions_set):
            if question.type == '0':
                self.fields['question_%s' % i] = forms.CharField(label=question.title, initial=answer[i].answer,
                                                                 disabled=True,
                                                                 widget=forms.TextInput(
                                                                     attrs={'class': 'form-control'}))
            if question.type == '1':
                choice_set = question.choice_set.all().order_by('id_in_question')
                options = [(c.id_in_question, c.label) for c in choice_set]
                self.fields['question_%s' % i] = forms.ChoiceField(choices=options,
                                                                   initial=answer[i].answer,
                                                                   disabled=True,
                                                                   widget=forms.RadioSelect,
                                                                   label=question.title)
            if question.type == '2':
                choice_set = question.choice_set.all().order_by('id_in_question')
                options = [(c.id_in_question, c.label) for c in choice_set]
                self.fields['question_%s' % i] = forms.MultipleChoiceField(choices=options,
                                                                           disabled=True,
                                                                           initial=ast.literal_eval(answer[i].answer),
                                                                           required=False, label=question.title,
                                                                           widget=forms.CheckboxSelectMultiple)
