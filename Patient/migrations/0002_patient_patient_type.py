# Generated by Django 3.1.1 on 2021-02-08 03:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Patient', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='patient',
            name='patient_type',
            field=models.CharField(default=1, max_length=100, verbose_name='Patient Type'),
            preserve_default=False,
        ),
    ]
