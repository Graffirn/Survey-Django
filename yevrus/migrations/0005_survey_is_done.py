# Generated by Django 2.2.5 on 2019-11-19 08:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('yevrus', '0004_auto_20191118_2305'),
    ]

    operations = [
        migrations.AddField(
            model_name='survey',
            name='is_done',
            field=models.BooleanField(default=False),
        ),
    ]