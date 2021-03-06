# Generated by Django 3.1.1 on 2021-04-10 13:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_type', models.CharField(blank=True, choices=[('product', 'Product'), ('other', 'Other')], max_length=50, null=True, verbose_name='Status')),
                ('category_name', models.CharField(max_length=50, verbose_name='Category Name')),
                ('category_image', models.ImageField(blank=True, null=True, upload_to='category_image/', verbose_name='Image')),
                ('active_status', models.BooleanField(default=1, verbose_name='Is Active')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Creation Date & Time')),
                ('updated_at', models.DateTimeField(blank=True, null=True, verbose_name='Updation Date & Time')),
            ],
            options={
                'verbose_name': 'Category',
                'verbose_name_plural': ' Categories',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=100, verbose_name='Product Name')),
                ('active_status', models.BooleanField(default=1, verbose_name='Is Active')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Creation Date & Time')),
                ('updated_at', models.DateTimeField(blank=True, null=True, verbose_name='Updation Date & Time')),
                ('category', models.ForeignKey(limit_choices_to={'active_status': '1'}, on_delete=django.db.models.deletion.CASCADE, related_name='Product_category', to='Product.category', verbose_name='Category')),
            ],
            options={
                'verbose_name': 'Product',
                'verbose_name_plural': '  Products',
            },
        ),
    ]
