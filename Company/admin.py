# import requests
# import json
# from django.contrib import admin
# from Company.models import Company
# from datetime import datetime
# from django.contrib.admin import site
# from django.forms.utils import ErrorList
# from django.contrib.auth.models import User
# from rest_framework import serializers
# from django.db.models import Q
# from Customer.models import *

# def make_active(modeladmin, request, queryset):
#     queryset.update(active_status="1", updated_at=datetime.now())
# make_active.short_description = "Move Items to Active"

# def make_deactive(modeladmin, request, queryset):
#     queryset.update(active_status="0", updated_at=datetime.now())
# make_deactive.short_description = "Move Items to Deactive"


# class CustomerSerializer(serializers.ModelSerializer):
# 	class Meta:
# 		model = CustomerProfile
# 		fields = '__all__'


# def user_create(username, password,user_type,area):
# 	data = {}
# 	user_creation = User.objects.create_user(
# 						username=username,
# 						password=password,
# 						is_staff=True,
# 						is_active=True,
# 						is_superuser=True
# 						)
# 	if user_creation:
# 		data["auth_user"] = user_creation.id
# 		data['active_status'] = 1
# 		data['username'] = username
# 		data['password'] = password
# 		data['user_type'] = user_type
# 		data['area'] = area
# 		data['emp_code'] = '001'
# 		data['name'] = 'SuperAdmin'
# 		serializer = CustomerSerializer(data=data)
# 		if serializer.is_valid():
# 			data_info = serializer.save()
# 		else:
# 			print("QQQQQQQQQQQQQQQQQQQQQ",serializer.errors)

# 	return user_creation

# class CompanyAdmin(admin.ModelAdmin):
# 	exclude = [
# 			'created_at',
# 			'updated_at',
# 			'active_status'
# 			]
# 	search_fields = [
# 		'name',
# 		]
# 	list_display = [
# 		  'name',
# 		  'username',
# 		  'address',
# 		  'active_status',
# 		  'created_at',
# 		  'updated_at',
# 			]
# 	actions = [make_active, make_deactive]
	
# 	list_per_page = 10
	
# 	def save_model(self, request, obj, form, change):
# 		if not change:
# 			created = user_create(obj.username, obj.password,obj.user_type_id,obj.area_id)
			
# 			user_id = User.objects.get(id=created.id)
# 			obj.auth_user = user_id
# 			obj.save()
# 		else:
# 			auth_user = User.objects.filter(id = obj.auth_user_id)
# 			auth_user.update(username=obj.username)
# 			for user in auth_user:
# 				user.set_password(obj.password)
# 				user.save()
# 			obj.updated_at = datetime.now()
# 			obj.save()

# 	def has_delete_permission(self, request, obj=None):
# 		return True

# 	def has_add_permission(self, request, obj=None):
# 		return True


# admin.site.register(Company,CompanyAdmin)

