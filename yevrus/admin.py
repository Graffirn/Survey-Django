from django.contrib import admin

from .models import *
# Register your models here.


admin.site.register(Question)
admin.site.register(Choice)
admin.site.register(Votes)
admin.site.register(SurveyTitle)
admin.site.register(SurveyQuestion)
admin.site.register(SurveyAnswer)
