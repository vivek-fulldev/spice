from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils.safestring import mark_safe
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.postgres.fields import JSONField
from Customer.models import CustomerProfile
from django.contrib.postgres.fields import ArrayField,JSONField



class Patient(models.Model):
	auth_user = models.OneToOneField(
		User, 
		on_delete=models.CASCADE,
		related_name='Patient_auth_user', 
		null=True,
		blank=True)
	patient_type = models.CharField(
		max_length=100, 
		verbose_name='Patient Type')
	patient_id = models.CharField(
		max_length=100, 
		verbose_name='Patient ID', 
		unique=True)
	patient_name = models.CharField(
		max_length=100, 
		verbose_name='Name'
		)
	address = models.CharField(
		max_length=500,
		null=True,
		blank=True,
		verbose_name='Address')
	phone = models.CharField(
		max_length=20,
		verbose_name='Mobile No',
		null=True,
		blank=True)
	sex = models.CharField(
		max_length=100,
		verbose_name='Sex', 
		null=True, 
		blank=True)
	age = models.CharField(
		max_length=100, 
		verbose_name='Age', 
		null=True,
		blank=True)
	date_of_collection = models.DateTimeField(
		blank=True, 
		null=True,
		verbose_name='Date Of Collection')
	time = models.TimeField(
		blank=True, 
		null=True,
		verbose_name='Time')
	location = models.CharField(
		max_length=100, 
		verbose_name='Location', 
		null=True,
		blank=True)

	diagnosis = models.CharField(
		max_length=100, 
		verbose_name='Diagnois', 
		null=True,
		blank=True)

	no_of_doses = models.CharField(
		max_length=100, 
		verbose_name='Diagnois', 
		null=True,
		blank=True)

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

	rate = models.CharField(
		max_length=100, 
		blank=True, 
		null=True,
		verbose_name='Name')
	paid = ArrayField(
		models.TextField(),
		null=True, 
		blank=True,\
		verbose_name="Paid")


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
		verbose_name = 'Patient'
		verbose_name_plural = ' Patient'

	def __str__(self):
		return self.patient_name


class SplitTest(models.Model):
	patient_id = models.CharField(
		max_length=100, 
		verbose_name='Patient ID')
	
	patient_name = models.CharField(
		max_length=100, 
		verbose_name='Name')
	address = models.CharField(
		max_length=500,
		null=True,
		blank=True,
		verbose_name='Address')
	phone = models.CharField(
		max_length=20,
		verbose_name='Mobile No',
		null=True,
		blank=True)

	sex = models.CharField(
		max_length=100,
		verbose_name='Sex', 
		null=True, 
		blank=True)
	age = models.CharField(
		max_length=100, 
		verbose_name='Age', 
		null=True,
		blank=True)
	

	diagnosis = models.CharField(
		max_length=100, 
		verbose_name='Diagnois', 
		null=True,
		blank=True)



	split_quantity = models.CharField(
		max_length=100, 
		verbose_name='Name', 
		unique=True)

	user = models.ForeignKey(
		CustomerProfile, 
		related_name='SplitTest_user',
		on_delete=models.CASCADE,
		verbose_name='User',
		limit_choices_to={'active_status':'1'})

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
		verbose_name = 'SplitTest'
		verbose_name_plural = ' SplitTest'

	def __str__(self):
		return self.patient_id



class SampleCollection(models.Model):
	patient_id = models.CharField(
		max_length=100, 
		verbose_name='Patient ID')
	
	patient_name = models.CharField(
		max_length=100, 
		verbose_name='Name')
	address = models.CharField(
		max_length=500,
		null=True,
		blank=True,
		verbose_name='Address')
	phone = models.CharField(
		max_length=20,
		verbose_name='Mobile No',
		null=True,
		blank=True)
	sex = models.CharField(
		max_length=100,
		verbose_name='Sex', 
		null=True, 
		blank=True)
	age = models.CharField(
		max_length=100, 
		verbose_name='Age', 
		null=True,
		blank=True)

	location = models.CharField(
		max_length=20,
		verbose_name='Location',
		null=True,
		blank=True)
	diagnosis = models.CharField(
		max_length=100, 
		verbose_name='Diagnois', 
		null=True,
		blank=True)
	
	quantity = models.CharField(
		max_length=100, 
		verbose_name='quantity', 
		null=True,
		blank=True)


	user = models.ForeignKey(
		CustomerProfile, 
		related_name='SampleCollection_user',
		on_delete=models.CASCADE,
		verbose_name='User')

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
		verbose_name = 'SampleCollection'
		verbose_name_plural = ' SampleCollection'

	def __str__(self):
		return self.patient_id



class PaidAmount(models.Model):
	patient_id = models.CharField(
		max_length=100, 
		verbose_name='Patient ID')
	
	rate = models.CharField(
		max_length=100, 
		verbose_name='Name')
	paid = ArrayField(
		models.TextField(),
		null=True, 
		blank=True,\
		verbose_name="Paid")

	partial_paid = ArrayField(
		models.TextField(),
		null=True, 
		blank=True,\
		verbose_name="Partial Paid")

	user = models.ForeignKey(
		CustomerProfile, 
		related_name='PaidAmount_user',
		on_delete=models.CASCADE,
		verbose_name='User')

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
		verbose_name = 'PaidAmount'
		verbose_name_plural = ' PaidAmount'

	def __str__(self):
		return self.patient_id




class InscusionOut(models.Model):
	patient_id = models.CharField(
		max_length=100, 
		verbose_name='Patient ID')
	
	patient_name = models.CharField(
		max_length=100, 
		verbose_name='Name')
	address = models.CharField(
		max_length=500,
		null=True,
		blank=True,
		verbose_name='Address')
	phone = models.CharField(
		max_length=20,
		verbose_name='Mobile No',
		null=True,
		blank=True)
	sex = models.CharField(
		max_length=100,
		verbose_name='Sex', 
		null=True, 
		blank=True)
	age = models.CharField(
		max_length=100, 
		verbose_name='Age', 
		null=True,
		blank=True)

	location = models.CharField(
		max_length=20,
		verbose_name='Location',
		null=True,
		blank=True)
	diagnosis = models.CharField(
		max_length=100, 
		verbose_name='Diagnois', 
		null=True,
		blank=True)
	user = models.ForeignKey(
		CustomerProfile, 
		related_name='InscusionOut_user',
		on_delete=models.CASCADE,
		verbose_name='User')

	name = models.CharField(
		max_length=100, 
		verbose_name='Name', 
		null=True,
		blank=True)


	location = models.CharField(
		max_length=100, 
		verbose_name='Location', 
		null=True,
		blank=True)


	no_of_doses = models.CharField(
		max_length=100, 
		verbose_name='Diagnois', 
		null=True,
		blank=True)
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
		verbose_name = 'Inscusion Out'
		verbose_name_plural = ' Inscusion Out'

	def __str__(self):
		return self.patient_id