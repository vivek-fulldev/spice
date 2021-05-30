from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils.safestring import mark_safe
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.postgres.fields import JSONField
from Configuration.models import AreaMaster,UserType




class CustomerProfile(models.Model):
	auth_user = models.OneToOneField(
		User, 
		on_delete=models.CASCADE,
		related_name='CustomerProfile_auth_user', 
		null=True,
		blank=True)
	user_type = models.ForeignKey(
		UserType, 
		related_name='CustomerProfile_user_type',
		on_delete=models.CASCADE,
		verbose_name='User Type',
		limit_choices_to={'active_status':'1'})
	area = models.ForeignKey(
		AreaMaster, 
		related_name='CustomerProfile_area',
		on_delete=models.CASCADE,
		verbose_name='Area',
		limit_choices_to={'active_status':'1'})
	emp_code = models.CharField(
		max_length=100, 
		verbose_name='Employee COde', 
		unique=True)
	username = models.CharField(
		max_length=100, 
		verbose_name='User Name', 
		unique=True)
	name = models.CharField(
		max_length=100, 
		verbose_name='Name')
	password = models.CharField(
		max_length=20,
		verbose_name='Pin')
	mobile = models.CharField(
		max_length=20,
		verbose_name='Mobile No',
		null=True,
		blank=True)
	extn = models.CharField(
		max_length=100,
		verbose_name='extn', 
		null=True, 
		blank=True)
	email = models.EmailField(
		max_length=100, 
		verbose_name='Email Id', 
		null=True,
		blank=True)
	remarks = models.CharField(
		max_length=1000, 
		null=True, 
		blank=True, 
		verbose_name='Address')


	barcode_pic = models.CharField(
		max_length=100, 
		blank=True, 
		null=True,
		verbose_name='Barcode Pic')
	barcode_info = models.CharField(
		max_length=100, 
		blank=True, 
		null=True,
		verbose_name='Barcode Info')


	active_status = models.BooleanField(
		default=0, 
		verbose_name='Is Active')

	created_at = models.DateTimeField(
		auto_now_add=True,
		verbose_name='Creation Date & Time')
	updated_at = models.DateTimeField(
		blank=True, 
		null=True,
		verbose_name='Updation Date & Time')


	class Meta:
		verbose_name = 'Customer'
		verbose_name_plural = ' Customer Profiles'

	def __str__(self):
		return self.name



