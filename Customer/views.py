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
from Configuration.models import UserType,AreaMaster

class CustomerSerializer(serializers.ModelSerializer):
	class Meta:
		model = CustomerProfile
		fields = '__all__'


class CustomersSerializer(serializers.ModelSerializer):
	def to_representation(self, instance):
		representation = super(CustomersSerializer, self).to_representation(instance)
		representation['user_type'] = UserType.objects.filter(id=instance.user_type_id)[0].user_type
		representation['area'] = AreaMaster.objects.filter(id=instance.area_id)[0].area

		return representation
	class Meta:
		model = CustomerProfile
		fields = '__all__'


class CustomerssSerializer(serializers.ModelSerializer):
	def to_representation(self, instance):
		representation = super(CustomerssSerializer, self).to_representation(instance)
		representation['user_type'] = []
		d = {}
		d['label'] =  UserType.objects.filter(id=instance.user_type_id)[0].user_type
		d['value'] = instance.user_type_id
		representation['user_type'].append(d)
		
		representation['area'] = []
		a = {}
		a['label'] =  AreaMaster.objects.filter(id=instance.area_id)[0].area
		a['value'] = instance.area_id
		representation['area'].append(a)
		return representation
	class Meta:
		model = CustomerProfile
		fields = '__all__'


class activeUser(APIView):
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
            record = CustomerProfile.objects.filter(id=data["id"])
            if record.count() != 0:
                data["updated_at"] = datetime.now()
                if data["active_status"] == "true":
                    info_msg = "User is activated successfully!!"
                else:
                    info_msg = "User is deactivated successfully!!"
                serializer = \
                CustomerSerializer(record[0],data=data,partial=True)
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





















class UserListingAPI(ListAPIView):
    """
    User List GET API

        Service usage and description : This API is used to list user.
        Authentication Required : YES

    """
    permission_classes = (
        IsAuthenticated,
    )
    queryset = CustomerProfile.objects.all()
    serializer_class = CustomersSerializer




class UserRetrieveAPI(RetrieveAPIView):
    """
    User Data Retrieval GET API

        Service usage and description : This API is used to retrieve user details.
        Authentication Required : YES
    """

    permission_classes = (IsAuthenticated,)
    serializer_class = CustomerssSerializer
    queryset = CustomerProfile.objects.all()






class UserCreate(CreateAPIView):
	"""
	Create User Post API, This API can be used to add user

		Authentication Required		 	: 		Yes
		Service Usage & Description	 	: 		This Api is used to add user.

		Data Post: {

			"user_type"               : "aaaa", //required
			"area"                    : "image",
			'emp_code '               : "ssdfdsfsdf",
			"username"                : "",
			"name"                    : ""
			"password"                : ""
			"mobile"                  :
			"extn"                   : "image"
			"email"					  :
			"remarks"
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
			err_message["user_type"]   = only_required(data["user_type"],"User Type")
			err_message["area"]        = only_required(data["area"],"Area")
			err_message["username"]    = only_required(data["username"],"username")
			err_message["password"]       = only_required(data["password"],"password")
			err_message["name"]        = only_required(data["name"],"name")
			err_message["emp_code"]        = only_required(data["emp_code"],"Employee Code")

			if "id" in data:
				unique_check = CustomerProfile.objects.filter(~Q(id=data["id"]),\
					Q(username__iexact=data["username"]))
			else:
				unique_check = CustomerProfile.objects.filter(username__iexact=data["username"])
			if unique_check.count() != 0:
				err_message["unique_check"] = "Username with this name already exists!!"
			else:
				pass
			if unique_check.count() != 0:
				err_message["unique_check"] = "Username with this name already exists!!"
			else:
				pass
			
			if "id" in data:
				unique_check = CustomerProfile.objects.filter(~Q(id=data["id"]),\
					Q(emp_code__iexact=data["emp_code"]))
			else:
				unique_check = CustomerProfile.objects.filter(emp_code__iexact=data["emp_code"])
			if unique_check.count() != 0:
				err_message["unique_check"] = "Emp_code with this name already exists!!"
			else:
				pass
			if unique_check.count() != 0:
				err_message["unique_check"] = "Emp_code with this name already exists!!"
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
				record = CustomerProfile.objects.filter(id=data['id'])
				if record.count() == 0:
					return Response(
						{
							"success": False,
							"message": "User data is not valid to update!!"
						}
					)
				else:
					data["updated_at"] = datetime.now()
					serializer = CustomerSerializer(record[0],data=data,partial=True)
					if serializer.is_valid():
						data_info = serializer.save()
						return Response({
						"success": True, 
						"message": "User is updated successfully!!"
						})
					else:
						return Response({
							"success": False, 
							"message": str(serializer.errors)
						})
			else:
				user_data = {}
				user_data['username'] = data['username']
				user_data['password'] = data['password']
				create_user = User.objects.create_user(
					username=user_data['username'],
					password=user_data['password'],
					is_staff=False,
					is_active=True,
				)
				if create_user:
					data["auth_user"] = create_user.id
					data['active_status'] = 1
					serializer = CustomerSerializer(data=data)
					if serializer.is_valid():
						data_info = serializer.save()
						# data_barcode = {}
						# dev_id = data_info.id
						# barcode_data = data['username'] + ',' + data['emp_code'] + ',' + data['name']
						# a = df.create(barcode_data)
						# images_path = settings.BASE_DIR+'/media/barcode/'
						# a.png(images_path+barcode_data+'.png',scale=6,module_color=[0, 0, 0, 128],
						# 	background=[0xff, 0xff, 0xcc])
						# data['barcode_pic'] = str(dev_id)+'.png'
						# data['barcode_info'] = dev_id
						# cdata = CustomerProfile.objects.filter(id=data_info.id)
						# serializer = CustomerSerializer(cdata[0],data=data,partial=True)
						# if serializer.is_valid():
						# 	data_info = serializer.save()
						return Response({
							"success": True, 
							"message": "User is Created successfully!!"
							})                
					else:
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
			print("User creation/updation Api Stucked into exception!!")
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})





class SignIn(APIView):

	"""	
	Customer login POST API

		Authentication Required		: No
		Service Usage & Description	: This Api is used to provide login services to users.

		Data Post: {

			"username"			    : "umesh",
			"password"		        : "123456",
			"area"                  : ""
		}

		Response: {

			"success"				: true,
			"credential"			: true,
			"message"				: "You are logged in now!!",
			"user_type"				: "is_outlet",
			"token"					: "1614ffa75cb577542c76ae4ad6ea146b61d688fc",
			"user_id"				: 6
		}

	"""
	
	def post(self, request, format=None):
		try:
			data = request.data
			err_message = {}
			err_message["username"] =  validation_master_anything(
									   data["username"],
									  "Username", username_re, 3)
			err_message["password"] =  only_required(data["password"],"Password")
			err_message["area"] =  only_required(data["area"],"Location")
			if any(err_message.values())==True:
				return Response({
					"success": False,
					"error" : err_message,
					"message" : "Please correct listed errors!!"
					})
			is_user = CustomerProfile.objects.filter(username=data['username'])
			if is_user.count() == 1:
				user_authenticate = authenticate(username=data['username'],password=data['password'])
				if user_authenticate == None:
					return Response \
							({
								"success"		: False,
								"credential"    : False,
								"message"       : "Please enter valid login credentials!!"
							})
				else:
					if user_authenticate: 

						login(request,user_authenticate)
						token, created = Token.objects.get_or_create(user=user_authenticate)
						user_id = token.user_id
						return Response({
							"success"		: True,
							"credential" 	: True,
							"message" 		: "You are logged in now!!",
							"token"			: token.key,
							"user_id"       : user_id,
							"is_superuser"  : user_authenticate.is_superuser,
							"name"          : user_authenticate.username,
							"user_type"     : is_user[0].user_type.user_type,


							})
			else:
				user_authenticate = authenticate(username=data['username'],
												password=data['password'])
				if user_authenticate == None:
					return Response({
						"success"       : False,
						"credential"    : False,
						"message"       : "Your account is not activated, please open your registered email!!"
						})
				else:
					pass
				if user_authenticate and user_authenticate.is_active == True \
										and user_authenticate.is_staff==True\
										and user_authenticate.is_superuser == True:
					login(request,user_authenticate)
					token, created = Token.objects.get_or_create(user=user_authenticate)
					user_id = token.user_id
					return Response({
						"success"		: True,
						"credential"	: True,
						"message"       : "You are logged in now!!",
						"token"         : token.key,
						"is_superuser"  : user_authenticate.is_superuser,
						"user_id"       : user_id,
						"user_type"     : 'Superadmin',
						})
				else:
					return Response({
						"success"    : False,
						"credential" : False,
						"message"    : "Please enter valid login credentials!!"
						})
			return Response({
					"success"    : False,
					"credential" : False,
					"message"    : "This Username does not exist in the system!!"
					})
		except Exception as e:
			print("User Login Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})



class Logout(APIView):
	"""
	User logout POST API

		Authentication Required		: Yes
		Service Usage & Description	: This Api is used to provide logout service to user.

		Data Post: {

			"token": "95dabfce1f8ebe9331851a1a1c5aa22bcb9b8120"
		}

		Response: {

			"success": True,
			"message" : "You have been successfully logged out!!"
		}

	"""
	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			self.authuserId = request.user.id
			userData = User.objects.filter(id=self.authuserId).first()
			if userData:
				request.user.auth_token.delete()
				logout(request)
				return Response({
							"success": True,
							"message": "You have been successfully logged out!!",
							})
			else:
				return Response({
							"success": False,
							"message": "User not Found!!",
							})
		except Exception as e:
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})


class ChangePassword(APIView):
	"""
	Change Password POST API

		Authentication Required		: Yes
		Service Usage & Description	: This Api is used to change password of users.

		Data Post: {
			"password"		   : "12345678",
			"new_pwd"		   : "123456",
			"c_pwd" 	       : "123456",
			"user_type"        : "school"
 		}

		Response: {

			"success": True, 
			"message": "Your password has been changed successfully!!",
		}

	"""

	permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			mutable = request.POST._mutable
			request.POST._mutable = True
			data = request.data
			dt = {}
			err_message = {}
			err_message["password"] = only_required(data["password"],"Old Password")
			err_message["new_pwd"] = validation_master_anything(data["new_pwd"],"New Password",
				pass_re, 6)
			err_message["c_pwd"] = \
			validation_master_anything(data["c_pwd"],"Confirm Password",
				pass_re, 6)
			if data["new_pwd"]!=data["c_pwd"]\
					and err_message["c_pwd"]==None:
				err_message["c_pwd"] = "Your password don't match!!"
			if any(err_message.values())==True:
				return Response({
					"success": False, 
					"error" : err_message,
					"message" : "Please correct listed errors!!" 
					})
			user = request.user
			if data["user_type"] == "School":
				is_user = SchoolName.objects.filter(password=data["password"],auth_user=user.id,
				                 					active_status=1)
			elif data["user_type"] == "Parent":
				is_user = GuardianName.objects.filter(password=data["password"],auth_user=user.id,
				                 					active_status=1)
			else:
				is_user = Company.objects.filter(password=data['password'],auth_user=user.id)
			
			if is_user.count() == 0:
				return Response({
						"oldpass": False,
						"message": "Your credentials are not authenticated!!"
						})
			else:
				data["username"] = is_user[0].username
			check_the_user = User.objects.filter(id=user.id).first()
			if is_user.count()==1 and check_the_user:
				try:
					data["password"] = request.data["new_pwd"]
					check_the_user.set_password(data["new_pwd"])
					check_the_user.save()
					if data["user_type"] == "School":
						data["flag"] = 1
						serializer = SchoolSerializer(is_user[0],data=data, partial=True)
					elif data['user_type'] == "Parent":
						data["flag"] = 1
						serializer = ParentSerializer(is_user[0],data=data, partial=True)
					else:
						dt['password'] = data['password']
						serializer = CompanySerializer(is_user[0],data=dt, partial=True)
					if serializer.is_valid():
						serializer.save()
						user_authenticate = authenticate(username=data['username'], 
											password=data['password'])
						login(request,user_authenticate)
					else:
						print("something went wrong!!")
						return Response({
							"success": False, 
							"message": str(serializer.errors),
							})
					return Response({
						"success": True,
						"message": "Your password has been changed successfully!!"
						})
				except Exception as e:
					return Response({
					"success": False,
					"message": str(e)
					})
			else:
				return Response({
					"success": False,
					"message": str(check_the_user)
					})
		except Exception as e:
			print("Change Password Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})
