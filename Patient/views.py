import os
import re
import json
from rest_framework.status import (
	HTTP_200_OK,
	HTTP_406_NOT_ACCEPTABLE,
	HTTP_401_UNAUTHORIZED,
	HTTP_500_INTERNAL_SERVER_ERROR,
)
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from Customer.api_packages import *
from rest_framework import serializers
from django.db.models import Q
from rest_framework.views import APIView
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token
from django.contrib.auth import logout
from datetime import datetime,timedelta
from rest_framework.generics import (
		CreateAPIView, 
		UpdateAPIView, 
		ListAPIView,
		RetrieveAPIView)
from django.http import Http404
from Customer.models import CustomerProfile
import pyqrcode as df
from champ import settings
from Patient.models import Patient,SplitTest,SampleCollection,PaidAmount,InscusionOut
from random import randint
import dateutil.parser
from django.db.models import Count, Sum,Max

def addr_set():
	domain_name = "https://fast-fjord-16773.herokuapp.com/media/patientbarcode/"
	return domain_name

def addr_set1():
	domain_name = "https://fast-fjord-16773.herokuapp.com/media/barcodes/"
	return domain_name



# def addr_set():
# 	domain_name = "http://192.168.0.139:1234/media/patientbarcode/"
# 	return domain_name

# def addr_set1():
# 	domain_name = "http://192.168.0.139:1234/media/barcodes/"
# 	return domain_name












def random_with_N_digits(n):
	range_start = 10**(n-1)
	range_end = (10**n)-1
	return randint(range_start, range_end)


class PatientSerializer(serializers.ModelSerializer):
	class Meta:
		model = Patient
		fields = '__all__'

class SplitSerializer(serializers.ModelSerializer):
	class Meta:
		model = SplitTest
		fields = '__all__'

class SampleSerializer(serializers.ModelSerializer):
	class Meta:
		model = SampleCollection
		fields = '__all__'

class PatientsSerializer(serializers.ModelSerializer):
	def to_representation(self, instance):
		representation = super(PatientsSerializer, self).to_representation(instance)
		representation['date_of_collection'] = instance.date_of_collection.strftime("%d-%b-%Y")
		return representation
	class Meta:
		model = Patient
		fields = '__all__'

class PatientssSerializer(serializers.ModelSerializer):
	def to_representation(self, instance):
		representation = super(PatientssSerializer, self).to_representation(instance)
		representation['sex'] = []
		d= {}
		d['label'] = instance.sex
		d['value'] = instance.sex
		representation['sex'].append(d)
		return representation
	class Meta:
		model = Patient
		fields = '__all__'

class SplitsSerializer(serializers.ModelSerializer):
	def to_representation(self, instance):
		representation = super(SplitsSerializer, self).to_representation(instance)
		domain_name = addr_set()
		c_data = Patient.objects.filter(patient_id=instance.patient_id)[0]
		cat_img = str(c_data.barcode_pic)
		if cat_img != "" and cat_img != None and cat_img != "null":
			full_path = domain_name + str(cat_img)
			representation['barcode_info'] = full_path
		else:
			representation['barcode_info'] = ''
		domain_name = addr_set1()
		cat_img = str(c_data.barcode_pic)
		if cat_img != "" and cat_img != None and cat_img != "null":
			full_path = domain_name + str(cat_img)
			representation['code_128'] = full_path
		else:
			representation['code_128'] = ''
		return representation
	class Meta:
		model = SplitTest
		fields = '__all__'



class activePatient(APIView):
	"""
	Area Action POST API

		Authentication Required     : Yes
		Service Usage & Description : This Api is used to activate or deactivate Area.

		Data Post: {
			"id"                        : "2",
			"active_status"             : "0"
		}

		Response: {

			"success": True, 
			"message": "Area is deactivated now!!",
			"data": final_result
		}

	"""
	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			from django.db.models import Q
			data = request.data
			err_message = {}
			if data["active_status"] == "true":
				pass
			elif data["active_status"] == "false":
				pass
			else:
				err_message["active_status"] = "Active status data is not valid!!"
			err_message["id"] = \
						validation_master_anything(data["id"],
						"Area Id",contact_re, 1)
			if any(err_message.values())==True:
				return Response({
					"success": False,
					"error" : err_message,
					"message" : "Please correct listed errors!!"
					})
			record = Patient.objects.filter(id=data["id"])
			if record.count() != 0:
				data["updated_at"] = datetime.now()
				if data["active_status"] == "true":
					info_msg = "Patient is activated successfully!!"
				else:
					info_msg = "Patient is deactivated successfully!!"
				serializer = \
				PatientSerializer(record[0],data=data,partial=True)
				if serializer.is_valid():
					data_info = serializer.save()
				else:
					print("something went wrong!!")
					return Response({
						"success": False, 
						"message": str(serializer.errors),
						})
			else:
				return Response(
					{
						"success": False,
						"message": "Area id is not valid to update!!"
					}
					)
			final_result = []
			final_result.append(serializer.data)
			return Response({
						"success": True, 
						"message": info_msg,
						"data": final_result,
						})
		except Exception as e:
			print("User action Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})




# class PatientUpdate(UpdateAPIView):
# 	"""
# 	Patient Update & Delete API View

# 		Service usage and description : This API is used to update or delete user type info.
# 		Authentication Required : YES

# 		Data Body for update(Patch method)
# 	"""

# 	permission_classes = (
# 		IsAuthenticated,
# 	)
# 	serializer_class = PatientSerializer
# 	queryset = Patient.objects.all()





def genrate_invoice_number(number):
	length = len(str(number))
	if length < 5:
		aa = 4 - length
		for a in range(aa):
			number = "0" + str(number)
	return str(number)





class PatientCreate(CreateAPIView):
	"""
	Create User Post API, This API can be used to add user

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"patient_name"                    : "image",
			'address '                        : "ssdfdsfsdf",
			"phone"                           : "",
			"sex"                             : ""
			"age"                             : ""
			"date_of_collection"              :
			"time"                            : "image"
			"location"				     	  :
			"diagnosis"                       :
			"no_of_doses"                     :
		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

#	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			data['users'] = request.user.id
			err_message = {}
			err_message["patient_name"]   = only_required(data["patient_name"],"Patient Name")
			# err_message["address"]        = only_required(data["address"],"Address")
			err_message["phone"]          = only_required(data["phone"],"Phone")
			err_message["age"]            = only_required(data["age"],"Age")
			err_message["sex"]            = only_required(data["sex"],"Sex")
			valid_frm = dateutil.parser.parse(data["date_of_collection"])
			data["date_of_collection"] = valid_frm
			if data['tab'] == str(1):
				pname = data['patient_name'].split(' ')[0]
				now = datetime.now()
				time = now.strftime("%m%y")
				pdata = Patient.objects.filter(patient_type='System')
				if pdata.count() > 0:
					invoicID = Patient.objects.filter(patient_type='System').aggregate(Max('id'))
					number = int(invoicID['id__max'])+1
				else:
					number = 1
				bID = genrate_invoice_number(number)
				data['patient_id'] = str(time) + str(bID)
				data['patient_type'] = 'System'
			else:
				err_message["patient_id"]   = only_required(data["patient_id"],"Patient ID")
				data['patient_type'] = 'Mannual'
			if "id" in data:
				unique_check = Patient.objects.filter(~Q(id=data["id"]),\
					Q(patient_id__iexact=data["patient_id"]))
			else:
				unique_check = Patient.objects.filter(patient_id__iexact=data["patient_id"])
			if unique_check.count() != 0:
				err_message["unique_check"] ="Patient id already exists!!"
			else:
				pass
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)
			
			print(data)

			if "id" in data:
				record = Patient.objects.filter(id=data['id'])
				if record.count() == 0:
					return Response(
						{
							"success": False,
							"message": "Patient data is not valid to update!!"
						}
					)
				else:
					data["updated_at"] = datetime.now()
					serializer = PatientSerializer(record[0],data=data,partial=True)
					if serializer.is_valid():
						data_info = serializer.save()
						return Response({
						"success": True, 
						"message": "Patient is updated successfully!!"
						})
					else:
						return Response({
							"success": False, 
							"message": str(serializer.errors)
						})
			else:
				user_data = {}
				user_data['username'] = data['patient_id']
				pwo = random_with_N_digits(5)
				user_data['password'] =   str(pwo)
				data['password'] = str(pwo)

				create_user = User.objects.create_user(
					username=user_data['username'],
					password=user_data['password'],
					is_staff=False,
					is_active=True,
				)

				if create_user:
					data["auth_user"] = create_user.id
					data['active_status'] = 1
					serializer = PatientSerializer(data=data)
					if serializer.is_valid():
						data_info = serializer.save()
						data_barcode = {}
						dev_id = data_info.id
						barcode_data = data['phone'] + ',' + data['patient_id'] + ',' + data['patient_name']
						a = df.create(barcode_data)
						images_path = str(settings.BASE_DIR)+'/media/patientbarcode/'
						a.png(images_path+str(data['patient_id'])+'.png',scale=6,module_color=[0, 0, 0, 128],
							background=[0xff, 0xff, 0xcc])
						data['barcode_pic'] = str(data['patient_id'])+'.png'
						data['barcode_info'] = barcode_data
						cdata = Patient.objects.filter(id=data_info.id)
						serializer = PatientSerializer(cdata[0],data=data,partial=True)
						if serializer.is_valid():
							data_info = serializer.save()
						import code128
						images_path = str(settings.BASE_DIR)+'/media/barcodes/'
						code128.image(barcode_data).save(images_path+str(data['patient_id'])+'.png')  # with PIL present
						with open("Hello World.svg", "w") as f:
								f.write(code128.svg(barcode_data))
						return Response({
							"success": True, 
							"message": "Patient is Created successfully!!"
							})                
					else:
						create_user.delete()
						print("sssssssssssssssssssssssssss")
						return Response({
								"success": False, 
								"message": str(serializer.errors)
							})
				else:
					create_user.delete()
					return Response({
								"success": False, 
							})
		except Exception as e:
			print("Patient creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})




class PatientListingAPI(ListAPIView):
	"""
	Patient List GET API

		Service usage and description : This API is used to list patient.
		Authentication Required : YES

	"""

	permission_classes = (
		IsAuthenticated,
	)
	serializer_class = PatientsSerializer
	queryset = Patient.objects.all()


class PatientRetrieveAPI(RetrieveAPIView):
	"""
	Patient Data Retrieval GET API

		Service usage and description : This API is used to retrieve patient details.
		Authentication Required : YES
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = PatientssSerializer
	queryset = Patient.objects.all()




class SplitCreate(CreateAPIView):
	"""
	Create Split Post API, This API can be used to add split

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"split_quantity"                  : "2",
			'user '                           : "ssdfdsfsdf",

		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			user_id = request.user.id
			err_message = {}
			data['user'] = CustomerProfile.objects.filter(auth_user_id=user_id)[0].id
			err_message["patient_id"]            = only_required(data["patient_id"],"Patient id")
			err_message["split_quantity"]        = only_required(data["split_quantity"],"Split Quantity")

			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)

			if "id" in data:
				record = SplitTest.objects.filter(id=data['id'])
				if record.count() == 0:
					return Response(
						{
							"success": False,
							"message": "Split data is not valid to update!!"
						}
					)
				else:
					data["updated_at"] = datetime.now()
					serializer = SplitSerializer(record[0],data=data,partial=True)
					if serializer.is_valid():
						data_info = serializer.save()
						return Response({
						"success": True, 
						"message": "Split test is updated successfully!!"
						})
					else:
						return Response({
							"success": False, 
							"message": str(serializer.errors)
						})
			else:
				data["updated_at"] = datetime.now()
				serializer = SplitSerializer(data=data)
				if serializer.is_valid():
					data_info = serializer.save()
					return Response({
					"success": True, 
					"message": "Split is updated successfully!!"
					})
				else:
					return Response({
						"success": False, 
						"message": str(serializer.errors)
					})
		except Exception as e:
			print("Split creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})


class SplitListingAPI(ListAPIView):
	"""
	Split List GET API

		Service usage and description : This API is used to list split.
		Authentication Required : YES

	"""

	permission_classes = (
		IsAuthenticated,
	)
	serializer_class = SplitSerializer
	queryset = SplitTest.objects.all()



class SplitRetrieveAPI(RetrieveAPIView):
	"""
	Split Data Retrieval GET API

		Service usage and description : This API is used to retrieve split details.
		Authentication Required : YES
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = SplitsSerializer
	queryset = SplitTest.objects.all()






class SplitAction(APIView):
	"""
	Split Action POST API

		Authentication Required     : Yes
		Service Usage & Description : This Api is used to activate or deactivate Split.

		Data Post: {
			"id"                        : "2",
			"active_status"             : "0"
		}

		Response: {

			"success": True, 
			"message": "Split is deactivated now!!",
			"data": final_result
		}

	"""
	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			from django.db.models import Q
			data = request.data
			err_message = {}
			if data["active_status"] == "true":
				pass
			elif data["active_status"] == "false":
				pass
			else:
				err_message["active_status"] = "Active status data is not valid!!"
			err_message["id"] = \
						validation_master_anything(data["id"],
						"Split Id",contact_re, 1)
			if any(err_message.values())==True:
				return Response({
					"success": False,
					"error" : err_message,
					"message" : "Please correct listed errors!!"
					})
			record = SplitTest.objects.filter(id=data["id"])
			if record.count() != 0:
				data["updated_at"] = datetime.now()
				if data["active_status"] == "true":
					info_msg = "Split is activated successfully!!"
				else:
					info_msg = "Split is deactivated successfully!!"
				serializer = \
				SplitSerializer(record[0],data=data,partial=True)
				if serializer.is_valid():
					data_info = serializer.save()
				else:
					print("something went wrong!!")
					return Response({
						"success": False, 
						"message": str(serializer.errors),
						})
			else:
				return Response(
					{
						"success": False,
						"message": "Split id is not valid to update!!"
					}
					)
			final_result = []
			final_result.append(serializer.data)
			return Response({
						"success": True, 
						"message": info_msg,
						"data": final_result,
						})
		except Exception as e:
			print("Split action Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})




class SplitUpdate(APIView):
	"""
	Create Split Post API, This API can be used to add split

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"split_quantity"                  : "2",
			'user '                           : "ssdfdsfsdf",

		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

	permission_classes = (IsAuthenticated,)
	def put(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			user_id = request.user.id
			split_id = self.kwargs.get("pk")
			err_message = {}
			data['user'] = CustomerProfile.objects.filter(auth_user_id=user_id)[0].id
			err_message["split_quantity"]   = only_required(data["split_quantity"],"Split Quantity")
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)
			data["updated_at"] = datetime.now()
			record = SplitTest.objects.filter(id=split_id)

			serializer = SplitSerializer(record[0],data=data,partial=True)
			if serializer.is_valid():
				data_info = serializer.save()
				return Response({
						"success": True, 
						"message": "Split test is updated successfully!!"
				})
			else:
				return Response({
					"success": False, 
					"message": str(serializer.errors)
				})
		except Exception as e:
			print("Split creation/updation Api Stucked into exception!!")
			return Response({
				"success": False, 
				"message": "Error happened!!", 
				"errors": str(e)})


class SampleCreate(CreateAPIView):
	"""
	Create Split Post API, This API can be used to add split

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"patient_name"                    : "2",
			'address'                        : "ssdfdsfsdf",
			"phone"                          : ""

		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			user_id = request.user.id
			err_message = {}
			data['user'] = CustomerProfile.objects.filter(auth_user_id=user_id)[0].id
			err_message["patient_id"]            = only_required(data["patient_id"],"Patient id")
			err_message["patient_name"]          = only_required(data["patient_name"],"Patient Name")
			err_message["Phone"]                 = only_required(data["phone"],"Phone")
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)

			serializer = SampleSerializer(data=data)
			if serializer.is_valid():
				data_info = serializer.save()
				return Response({
				"success": True, 
				"message": "Sample is created successfully!!"
				})
			else:
				return Response({
					"success": False, 
					"message": str(serializer.errors)
				})
		except Exception as e:
			print("Sample creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})



class SampleListingAPI(ListAPIView):
	"""
	Split List GET API

		Service usage and description : This API is used to list split.
		Authentication Required : YES

	"""

	permission_classes = (
		IsAuthenticated,
	)
	serializer_class = SampleSerializer
	queryset = SampleCollection.objects.all()


class SampleAction(APIView):
	"""
	Split Action POST API

		Authentication Required     : Yes
		Service Usage & Description : This Api is used to activate or deactivate Split.

		Data Post: {
			"id"                        : "2",
			"active_status"             : "0"
		}

		Response: {

			"success": True, 
			"message": "Split is deactivated now!!",
			"data": final_result
		}

	"""
	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			from django.db.models import Q
			data = request.data
			err_message = {}
			if data["active_status"] == "true":
				pass
			elif data["active_status"] == "false":
				pass
			else:
				err_message["active_status"] = "Active status data is not valid!!"
			err_message["id"] = \
						validation_master_anything(data["id"],
						"Sample Id",contact_re, 1)
			if any(err_message.values())==True:
				return Response({
					"success": False,
					"error" : err_message,
					"message" : "Please correct listed errors!!"
					})
			record = SampleCollection.objects.filter(id=data["id"])
			if record.count() != 0:
				data["updated_at"] = datetime.now()
				if data["active_status"] == "true":
					info_msg = "SampleCollection is activated successfully!!"
				else:
					info_msg = "SampleCollection is deactivated successfully!!"
				serializer = \
				SampleSerializer(record[0],data=data,partial=True)
				if serializer.is_valid():
					data_info = serializer.save()
				else:
					print("something went wrong!!")
					return Response({
						"success": False, 
						"message": str(serializer.errors),
						})
			else:
				return Response(
					{
						"success": False,
						"message": "Sample id is not valid to update!!"
					}
					)
			final_result = []
			final_result.append(serializer.data)
			return Response({
						"success": True, 
						"message": info_msg,
						"data": final_result,
						})
		except Exception as e:
			print("Sample action Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})



class RetrieveAPI(CreateAPIView):
	"""
	Create Split Post API, This API can be used to add split

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"split_quantity"                  : "2",
			'user '                           : "ssdfdsfsdf",

		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			user_id = request.user.id
			err_message = {}
			err_message["patient_id"]            = only_required(data["patient_id"],"Patient id")
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)
			record = Patient.objects.filter(patient_id=data['patient_id'])
			if record.count() == 0:
				return Response(
					{
						"success": False,
						"message": "Split data is not valid to update!!"
					}
				)
			else:
				final_result = []
				q_dict = {}
				q_dict['patient_name'] = record[0].patient_name
				q_dict['address'] = record[0].address
				q_dict['phone'] = record[0].phone
				q_dict['no_of_doses'] = record[0].no_of_doses
				q_dict['sex'] = record[0].sex
				q_dict['age'] = record[0].age
				q_dict['diagnosis'] = record[0].diagnosis
				q_dict['patient_id'] = record[0].patient_id
				domain_name = addr_set()
				cat_img = str(record[0].barcode_pic)
				if cat_img != "" and cat_img != None and cat_img != "null":
					full_path = domain_name + str(cat_img)
					q_dict['barcode_info'] = full_path
				else:
					q_dict['barcode_info'] = ''
				domain_name = addr_set1()
				cat_img = str(record[0].barcode_pic)
				if cat_img != "" and cat_img != None and cat_img != "null":
					full_path = domain_name + str(cat_img)
					q_dict['code_128'] = full_path
				else:
					q_dict['code_128'] = ''
				pdata = PaidAmount.objects.filter(patient_id=record[0].patient_id)
				if pdata.count() > 0:
					q_dict['rate'] = pdata[0].rate
					if len(pdata[0].partial_paid) > 0:
						sum_partialpaid = 0
						for index in pdata[0].partial_paid:
							sum_partialpaid = sum_partialpaid + float(index)
						q_dict['partial_amount'] = sum_partialpaid
						q_dict['partial'] = 'true'
					else:
						q_dict['partial'] = 'false'
					pamount = pdata[0].paid
					psum = 0
					for index in pamount:
						psum = psum + float(index)
					fsum = 0
					for i in pdata[0].partial_paid:
						fsum = fsum + float(i)
					q_dict['paid_amount'] = psum + fsum
					ta = int(psum)+ float(fsum)
					ramount = int(pdata[0].rate) - ta
					q_dict['rest_amount'] = ramount
					if len(pdata[0].paid) > 0:
						q_dict['amount'] = pdata[0].paid
					else:
						q_dict['amount'] = []
					q_dict['damount'] = []
				else:
					q_dict['rate'] = 0
					q_dict['amount'] = []
					q_dict['paid_amount'] = 0
					q_dict['rest_amount'] = 0

				final_result.append(q_dict)
				return Response({
					"success": True, 
					"data": final_result,

				})
		except Exception as e:
			print("Splits creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})


class RetrievesAPI(CreateAPIView):
	"""
	Create Split Post API, This API can be used to add split

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"split_quantity"                  : "2",
			'user '                           : "ssdfdsfsdf",

		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			user_id = request.user.id
			err_message = {}
			err_message["patient_id"]            = only_required(data["patient_id"],"Patient id")
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)
			record = Patient.objects.filter(patient_id=data['patient_id'])
			if record.count() == 0:
				return Response(
					{
						"success": False,
						"message": "Split data is not valid to update!!"
					}
				)
			else:
				final_result = []
				q_dict = {}
				q_dict['patient_name'] = record[0].patient_name
				q_dict['address'] = record[0].address
				q_dict['phone'] = record[0].phone
				q_dict['no_of_doses'] = record[0].no_of_doses
				q_dict['sex'] = record[0].sex
				q_dict['age'] = record[0].age
				q_dict['diagnosis'] = record[0].diagnosis
				q_dict['patient_id'] = record[0].patient_id

				domain_name = addr_set()
				cat_img = str(record[0].barcode_pic)
				
				if cat_img != "" and cat_img != None and cat_img != "null":
					full_path = domain_name + str(cat_img)
					q_dict['barcode_info'] = full_path
				else:
					q_dict['barcode_info'] = ''
				domain_name = addr_set1()
				cat_img = str(record[0].barcode_pic)
				if cat_img != "" and cat_img != None and cat_img != "null":
					full_path = domain_name + str(cat_img)
					q_dict['code_128'] = full_path
				else:
					q_dict['code_128'] = ''
				q_dict['barcode_detail'] = record[0].barcode_info
				
				idata = PaidAmount.objects.filter(patient_id=data['patient_id'])
				if idata.count() > 0:
					adata = len(idata[0].paid)
					indata = InscusionOut.objects.filter(patient_id=data['patient_id'],\
						no_of_doses=adata)
					if indata.count() > 0:
						q_dict['status'] = 0
						q_dict['does'] = ''
					else:
						q_dict['status'] = 1
						q_dict['does'] = adata
				else:
					q_dict['status'] = 0
					q_dict['does'] = ''

				final_result.append(q_dict)
				return Response({
					"success": True, 
					"data": final_result,

				})


		except Exception as e:
			print("Splits creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})


class AmountCreate(APIView):
	"""
	Amount POST API

		Authentication Required     : Yes
		Service Usage & Description : This Api is used to amount create.

		Data Post: {
			"patient_id"                        : "santosh8753",
			"rate"                              : "20000"
		}

		Response: {

			"success": True, 
			"message": "Split is deactivated now!!",
			"data": final_result
		}

	"""
	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			from django.db.models import Q
			data = request.data
			user_id = request.user.id
			data['user'] = CustomerProfile.objects.filter(auth_user_id=user_id)[0].id
			paid_data = PaidAmount.objects.filter(patient_id=data['patient_id'])
			if paid_data.count() > 0:
				sum_paid = 0
				if len(paid_data[0].paid) > 0:
					for index in paid_data[0].paid:
						sum_paid = sum_paid + float(index)

				sum_partialpaid = 0
				if len(paid_data[0].partial_paid) > 0:
					for index in paid_data[0].partial_paid:
						sum_partialpaid = sum_partialpaid + float(index)
				fma = sum_paid + sum_partialpaid +  float(data['amount'])
				if fma > int(data['rate']):
					err_message = {}
					err_message['large_amount'] = "Please enter exact amount"
					if any(err_message.values())==True:
						return Response({
							"success": False,
							"error" : err_message,
							"message" : "Please correct listed errors!!"
							})
				dp = Patient.objects.filter(patient_id=data['patient_id'])
				if dp.count() > 0:
					doses = dp[0].no_of_doses
					rate = float(data['rate']) // float(doses)
				if len(paid_data[0].partial_paid) > 0:
					lenpaidamount = len(paid_data[0].paid)
					flen = lenpaidamount + 1
					sum_partialpaid = 0
					for index in paid_data[0].partial_paid:
						sum_partialpaid = sum_partialpaid + float(index)
					if len(paid_data[0].paid) > 0:
						sum_paid = 0
						for index in paid_data[0].paid:
							sum_paid = sum_paid + float(index)
					else:
						sum_paid = 0
					final_amount = float(sum_partialpaid + float(data['amount'])) + sum_paid
					frate = flen * rate
					

					if final_amount >= frate:
						if data['amount'] == 0:
							udata = paid_data.update(partial_paid=[],rate=data['rate'])
						adata = paid_data[0].paid
						data['amount'] = float(data['amount']) + sum_partialpaid
						adata.append(data['amount'])
						udata = paid_data.update(paid=adata,partial_paid=[],rate=data['rate'])
						return Response({
							"success": True, 
						})
					else:
						adata = paid_data[0].partial_paid
						adata.append(data['amount'])
						udata = paid_data.update(partial_paid=adata,rate=data['rate'])
						return Response({
							"success": True, 
						})
				else:
					lenpaidamount = len(paid_data[0].paid)
					flen = lenpaidamount + 1
					sum_paid = 0
					for index in paid_data[0].paid:
						sum_paid = sum_paid + float(index)
					fam = float(sum_paid) + float(data['amount'])
					frate = flen * rate
					if fam >= frate:
						if data['amount'] == 0:
							udata = paid_data.update(partial_paid=[],rate=data['rate'])
						adata = paid_data[0].paid
						adata.append(data['amount'])
						udata = paid_data.update(paid=adata,partial_paid=[],rate=data['rate'])
						return Response({
							"success": True, 
						})
					else:
						amoutdata = []
						amoutdata.append(data['amount'])
						udata = paid_data.update(partial_paid=amoutdata,rate=data['rate'])
						return Response({
										"success": True, 
										})
			else:
				if 'amount' not in data:
					data['amount'] = 0
				if int(data['amount']) > int(data['rate']):
					err_message = {}
					err_message['large_amount'] = "Please enter exact amount"
					if any(err_message.values())==True:
						return Response({
							"success": False,
							"error" : err_message,
							"message" : "Please correct listed errors!!"
							})

				dp = Patient.objects.filter(patient_id=data['patient_id'])
				if dp.count() > 0:
					doses = dp[0].no_of_doses
					rate = float(data['rate']) // float(doses)
					if float(data['amount']) >= float(rate):
						amoutdata = []
						amoutdata.append(data['amount'])
						pdata = PaidAmount.objects.create(patient_id=data['patient_id'],rate=data['rate'],\
							paid=amoutdata,user_id=data['user'],partial_paid=[])
						if pdata:
							return Response({
										"success": True, 
										})
					else:
						amoutdata = []
						amoutdata.append(data['amount'])
						pdata = PaidAmount.objects.create(patient_id=data['patient_id'],rate=data['rate'],\
							partial_paid=amoutdata,user_id=data['user'],paid=[])
						if pdata:
							return Response({
										"success": True, 

										})
		except Exception as e:
			print("Pain Amount Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})





#    Inscusion Out Module

class InscusionSerializer(serializers.ModelSerializer):
	def to_representation(self, instance):
		representation = super(InscusionSerializer, self).to_representation(instance)
		representation['created_at'] = instance.created_at.strftime("%d-%b-%Y")
		o_time = instance.created_at+timedelta(hours=5,minutes=30)
		representation['time'] = o_time.strftime("%I:%M %p")
		if instance.updated_at != None:
			representation['updated_at'] = instance.updated_at.strftime("%d-%b-%Y")
			t_time = instance.updated_at+timedelta(hours=5,minutes=30)
			representation['utime'] = t_time.strftime("%I:%M %p")
		else:
			representation['utime'] = ''

		return representation
	class Meta:
		model = InscusionOut
		fields = '__all__'


class ISerializer(serializers.ModelSerializer):
	class Meta:
		model = InscusionOut
		fields = '__all__'




class InscusionUpdate(UpdateAPIView):
	"""
	Patient Update & Delete API View

		Service usage and description : This API is used to update or delete user type info.
		Authentication Required : YES

		Data Body for update(Patch method)
	"""

	permission_classes = (
		IsAuthenticated,
	)
	serializer_class = ISerializer
	queryset = InscusionOut.objects.all()

	def put(self, request, *args, **kwargs):
		data = request.data
		data['user'] = CustomerProfile.objects.filter(auth_user_id=self.request.user.id)[0].id
		data['updated_at'] =  datetime.now()
		return self.update(request, *args, **kwargs)











class InscusionRetrieveAPI(RetrieveAPIView):
	"""
	Patient Data Retrieval GET API

		Service usage and description : This API is used to retrieve patient details.
		Authentication Required : YES
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = InscusionSerializer
	queryset = InscusionOut.objects.all()
class InscusionCreate(CreateAPIView):
	"""
	Create Split Post API, This API can be used to add split

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"patient_name"                    : "2",
			'address'                        : "ssdfdsfsdf",
			"phone"                          : ""

		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			user_id = request.user.id
			err_message = {}
			data['user'] = CustomerProfile.objects.filter(auth_user_id=user_id)[0].id
			err_message["patient_id"]            = only_required(data["patient_id"],"Patient id")
			err_message["patient_name"]          = only_required(data["patient_name"],"Patient Name")
			err_message["Phone"]                 = only_required(data["phone"],"Phone")
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)

			serializer = InscusionSerializer(data=data)
			if serializer.is_valid():
				data_info = serializer.save()
				return Response({
				"success": True, 
				"message": "Inscusion out is created successfully!!"
				})
			else:
				return Response({
					"success": False, 
					"message": str(serializer.errors)
				})
		except Exception as e:
			print("Inscusion creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})








class InscusionListingAPI(ListAPIView):
	"""
	Split List GET API

		Service usage and description : This API is used to list split.
		Authentication Required : YES

	"""

	permission_classes = (
		IsAuthenticated,
	)
	serializer_class = InscusionSerializer
	queryset = InscusionOut.objects.all()

class InscusionAction(APIView):
	"""
	Inscusion Action POST API

		Authentication Required     : Yes
		Service Usage & Description : This Api is used to activate or deactivate Split.

		Data Post: {
			"id"                        : "2",
			"active_status"             : "0"
		}

		Response: {

			"success": True, 
			"message": "Split is deactivated now!!",
			"data": final_result
		}

	"""
	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			from django.db.models import Q
			data = request.data
			err_message = {}
			if data["active_status"] == "true":
				pass
			elif data["active_status"] == "false":
				pass
			else:
				err_message["active_status"] = "Active status data is not valid!!"
			err_message["id"] = \
						validation_master_anything(data["id"],
						"Inscusion Id",contact_re, 1)
			if any(err_message.values())==True:
				return Response({
					"success": False,
					"error" : err_message,
					"message" : "Please correct listed errors!!"
					})
			record = InscusionOut.objects.filter(id=data["id"])
			if record.count() != 0:
				data["updated_at"] = datetime.now()
				if data["active_status"] == "true":
					info_msg = "Inscusion is activated successfully!!"
				else:
					info_msg = "Inscusion is deactivated successfully!!"
				serializer = \
				InscusionSerializer(record[0],data=data,partial=True)
				if serializer.is_valid():
					data_info = serializer.save()
				else:
					print("something went wrong!!")
					return Response({
						"success": False, 
						"message": str(serializer.errors),
						})
			else:
				return Response(
					{
						"success": False,
						"message": "Inscusion id is not valid to update!!"
					}
					)
			final_result = []
			final_result.append(serializer.data)
			return Response({
						"success": True, 
						"message": info_msg,
						"data": final_result,
						})
		except Exception as e:
			print("Inscusion action Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})



class PatientUpdate(APIView):
	"""
	Create User Post API, This API can be used to add user

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"patient_id"                      : "aaaa", //required
			"patient_name"                    : "image",
			'address '                        : "ssdfdsfsdf",
			"phone"                           : "",
			"sex"                             : ""
			"age"                             : ""
			"date_of_collection"              :
			"time"                            : "image"
			"location"				     	  :
			"diagnosis"                       :
			"no_of_doses"                     :
		} 

		Response: {
				data = {....},
				status=status 201/400/423/404
		}

	"""

#	permission_classes = (IsAuthenticated,)
	def post(self, request, *args, **kwargs):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = self.request.data
			data['users'] = request.user.id
			err_message = {}
			err_message["patient_name"]   = only_required(data["patient_name"],"Patient Name")
			err_message["phone"]          = only_required(data["phone"],"Phone")
			err_message["age"]            = only_required(data["age"],"Age")
			err_message["sex"]            = only_required(data["sex"],"Sex")
			valid_frm = dateutil.parser.parse(data["date_of_collection"])
			data["date_of_collection"] = valid_frm
			if "id" in data:
				unique_check = Patient.objects.filter(~Q(id=data["id"]),\
					Q(patient_id__iexact=data["patient_id"]))
			else:
				unique_check = Patient.objects.filter(patient_id__iexact=data["patient_id"])
			if unique_check.count() != 0:
				err_message["unique_check"] ="Patient id already exists!!"
			else:
				pass
			if any(err_message.values()) == True:
				return Response(
					{
						"success" : False,
						"error": err_message, 
						"message": "Please correct listed errors!!"
					}
				)
			if "id" in data:
				record = Patient.objects.filter(id=data['id'])
				if record.count() == 0:
					return Response(
						{
							"success": False,
							"message": "Patient data is not valid to update!!"
						}
					)
				else:
					data["updated_at"] = datetime.now()
					serializer = PatientSerializer(record[0],data=data,partial=True)
					if serializer.is_valid():
						data_info = serializer.save()
						return Response({
						"success": True, 
						"message": "Patient is updated successfully!!"
						})
					else:
						return Response({
							"success": False, 
							"message": str(serializer.errors)
						})
		except Exception as e:
			print("Patient creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})

