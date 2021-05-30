# Generated by Django 3.1.1 on 2021-02-18 16:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Customer', '0004_auto_20210209_0653'),
        ('Patient', '0012_auto_20210213_0505'),
    ]

    operations = [
        migrations.AddField(
            model_name='paidamount',
            name='user',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='PaidAmount_user', to='Customer.customerprofile', verbose_name='User'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='samplecollection',
            name='location',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='Location'),
        ),
        migrations.AlterField(
            model_name='samplecollection',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='SampleCollection_user', to='Customer.customerprofile', verbose_name='User'),
        ),
    ]