# Generated by Django 3.1.1 on 2021-02-09 06:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Customer', '0003_auto_20210206_1557'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customerprofile',
            name='name',
            field=models.CharField(max_length=100, verbose_name='Name'),
        ),
    ]
