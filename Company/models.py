from django.db import models
from django.contrib.auth.models import User
from django.core.validators import RegexValidator
from Configuration.models import AreaMaster,UserType


class Company(models.Model):
	auth_user = models.OneToOneField(
		User, 
		on_delete=models.CASCADE,
        related_name='coach_auth_user', null=True,blank=True)
	user_type = models.ForeignKey(
		UserType, 
		related_name='Company_user_type',
		on_delete=models.CASCADE,
		verbose_name='User Type',
		limit_choices_to={'active_status':'1'})
	area = models.ForeignKey(
		AreaMaster, 
		related_name='Company_area',
		on_delete=models.CASCADE,
		verbose_name='Area',
		limit_choices_to={'active_status':'1'})


	name = models.CharField(
		max_length=100, 
		verbose_name='Company Name')
	username = models.CharField(
		max_length=100, 
		verbose_name='User Name', 
		unique=True)
	password = models.CharField(
		max_length=20,
		verbose_name='Password')
	address = models.CharField(
		max_length=250, 
		verbose_name='Address')
	email = models.EmailField(
		max_length=255,
		verbose_name='Email Id')
	mobile = models.CharField(
		max_length=15,
		verbose_name='Mobile No.')
	active_status = models.BooleanField(
		default=1,
		verbose_name="Is Active")
	created_at = models.DateTimeField(
		auto_now_add=True,
		blank=True,
		null=True,verbose_name='Creation Date')
	updated_at = models.DateTimeField(
		blank=True,
		null=True,
		verbose_name='Updation Date')
	flag = models.BooleanField(default=0,verbose_name="Is Login")

	class Meta:
		verbose_name = 'Super Admin'
		verbose_name_plural = 'Super Admin'

	def __str__(self):
		return self.name


