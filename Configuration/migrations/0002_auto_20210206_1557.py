# Generated by Django 3.1.1 on 2021-02-06 15:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Configuration', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='areamaster',
            name='area',
            field=models.CharField(max_length=100, verbose_name='Location'),
        ),
        migrations.AlterField(
            model_name='usertype',
            name='user_type',
            field=models.CharField(max_length=100, verbose_name='User Type'),
        ),
    ]
