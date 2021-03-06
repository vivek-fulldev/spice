# Generated by Django 3.1.1 on 2021-02-08 10:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Patient', '0004_splittest'),
    ]

    operations = [
        migrations.AddField(
            model_name='splittest',
            name='address',
            field=models.CharField(blank=True, max_length=500, null=True, verbose_name='Address'),
        ),
        migrations.AddField(
            model_name='splittest',
            name='patient_name',
            field=models.CharField(default=1, max_length=100, unique=True, verbose_name='Name'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='splittest',
            name='phone',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='Mobile No'),
        ),
    ]
