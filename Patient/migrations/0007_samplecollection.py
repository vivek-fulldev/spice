# Generated by Django 3.1.1 on 2021-02-09 05:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Customer', '0003_auto_20210206_1557'),
        ('Patient', '0006_auto_20210208_1634'),
    ]

    operations = [
        migrations.CreateModel(
            name='SampleCollection',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('patient_id', models.CharField(max_length=100, unique=True, verbose_name='Patient ID')),
                ('patient_name', models.CharField(max_length=100, unique=True, verbose_name='Name')),
                ('address', models.CharField(blank=True, max_length=500, null=True, verbose_name='Address')),
                ('phone', models.CharField(blank=True, max_length=20, null=True, verbose_name='Mobile No')),
                ('active_status', models.BooleanField(default=0, verbose_name='Is Active')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Creation Date & Time')),
                ('updated_at', models.DateTimeField(blank=True, null=True, verbose_name='Updation Date & Time')),
                ('user', models.ForeignKey(limit_choices_to={'active_status': '1'}, on_delete=django.db.models.deletion.CASCADE, related_name='SampleCollection_user', to='Customer.customerprofile', verbose_name='User')),
            ],
            options={
                'verbose_name': 'SampleCollection',
                'verbose_name_plural': ' SampleCollection',
            },
        ),
    ]
