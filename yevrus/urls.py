from django.urls import path, re_path
from django.contrib.auth import views as auth_views
from . import views

app_name = 'yevrus'

urlpatterns = [
    path('', views.log_in, name='login'),
    path('logout/', views.log_out, name='logout'),
    path('register/', views.register, name='register'),
    re_path(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$', views.activate,
            name='activate'),
    path('accounts/password_reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
    path('accounts/password_reset/done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('accounts/reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(),
         name='password_reset_confirm'),
    path('accounts/reset/done/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    path('password/', views.change_password, name='change_password'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('mysurveys/', views.mysurveys, name='mysurveys'),
    path('createsurveys/', views.createsurveys, name='createsurveys'),
    path('editsurvey/<survey_key>', views.editsurvey, name='editsurvey'),
    path('deletesurvey/<survey_key>', views.deletesurvey, name='deletesurvey'),
    path('surveys/<survey_key>', views.surveyresponse, name='surveyresponse'),
    path('showresponse/<survey_key>', views.show_response, name='show_response'),
    path('showresponse/<survey_key>/<response_id>', views.show_response_id, name='show_response_id'),
    path('export/<survey_key>', views.export_to_xls, name='export_to_xls'),
    path('get_chart/', views.get_chart, name='get_chart'),
    path('get_statistics/<survey_key>', views.get_statistics, name='get_statistics'),
    path('archive/<survey_key>', views.archive_survey, name='archive_survey'),
    path('publish/<survey_key>', views.publish_survey, name='publish_survey'),
]
