import datetime
import shortuuid

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

QUESTION_TYPE_CHOICES = (
    (0, 'TextQuestion'),
    (1, 'CheckboxQuestion'),
    (2, 'MultipleChoiceQuestion')
)


class Survey(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    key = models.CharField(max_length=30)
    title = models.CharField(max_length=255)
    is_published = models.BooleanField(null=False, default=False)
    is_done = models.BooleanField(null=False, default=False)

    def __init__(self, *args, **kwargs):
        super(Survey, self).__init__(*args, **kwargs)
        if kwargs.get('title'):
            self.title = kwargs['title']
        if not self.key:
            self.key = shortuuid.uuid()

    def publish(self):
        self.is_published = True

    def done(self):
        self.is_done = True

    def undone(self):
        self.is_done = False

    def change_archive_status(self):
        self.is_done = not self.is_done


class Question(models.Model):
    survey = models.ForeignKey(Survey, on_delete=models.CASCADE)
    id_in_survey = models.IntegerField()
    type = models.CharField(choices=QUESTION_TYPE_CHOICES, max_length=25)
    title = models.CharField(max_length=500, null=False)
    is_required = models.BooleanField(default=False)


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    label = models.CharField(max_length=200)
    id_in_question = models.IntegerField()


class Response(models.Model):
    survey = models.ForeignKey(Survey, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    submit_date = models.DateTimeField()

    def __init__(self, *args, **kwargs):
        super(Response, self).__init__(*args, **kwargs)
        if not self.submit_date:
            self.submit_date = timezone.now()


class Answer(models.Model):
    response = models.ForeignKey(Response, on_delete=models.CASCADE)
    id_in_response = models.IntegerField()
    type = models.CharField(choices=QUESTION_TYPE_CHOICES, max_length=25)
    answer = models.CharField(max_length=500, null=True)

