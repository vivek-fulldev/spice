# Generated by Django 3.1.1 on 2021-02-19 04:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Patient', '0015_auto_20210219_0350'),
    ]

    operations = [
        migrations.AddField(
            model_name='splittest',
            name='age',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Age'),
        ),
        migrations.AddField(
            model_name='splittest',
            name='diagnosis',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Diagnois'),
        ),
        migrations.AddField(
            model_name='splittest',
            name='sex',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Sex'),
        ),
    ]
