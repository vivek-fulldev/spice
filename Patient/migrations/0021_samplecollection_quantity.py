# Generated by Django 3.1.1 on 2021-02-22 09:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Patient', '0020_auto_20210220_1411'),
    ]

    operations = [
        migrations.AddField(
            model_name='samplecollection',
            name='quantity',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='quantity'),
        ),
    ]