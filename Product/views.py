from django.shortcuts import render
from rest_framework import serializers
from rest_framework.generics import (
	CreateAPIView,
	ListAPIView,
	DestroyAPIView,
	UpdateAPIView,
	RetrieveAPIView,
)
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_406_NOT_ACCEPTABLE
from Product.models import Category,Product,Contact
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from _thread import start_new_thread
import requests
import json

def addr_set():
	domain_name = "http://172.105.56.206:1234/media/"
	return domain_name

class CategorySerializer(serializers.ModelSerializer):
	class Meta:
		model = Category
		fields = "__all__"

class ProductSerializer(serializers.ModelSerializer):
	class Meta:
		model = Product
		fields = "__all__"


class ContactSerializer(serializers.ModelSerializer):
	class Meta:
		model = Contact
		fields = "__all__"

class ContactSerializer(serializers.ModelSerializer):
	class Meta:
		model = Contact
		fields = "__all__"


class CategoryCreate(CreateAPIView):
	"""
	Category Creation Post API

		Service Usage and Description : This API is used to create category.
		Authentication Required : YES

		Data : {
			"category_type"          : "1",  
			"category_name"          : "ABC"
			"category_image"         : ""    
		}

		Response : {
			"success": True,
		}
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = CategorySerializer
	queryset = Category.objects.all()

	# def post(self,request):
	# 	print("ssssssssssssssssssss",request.data)


class CategoryUpdate(UpdateAPIView):
	"""
	Category Update  API View

		Service usage and description : This API is used to update for category.
		Authentication Required : YES

		Data Body for update(Patch method)
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = CategorySerializer
	def put(self, request):
		try:
			data = request.data
			category = Category.objects.filter(id=data["id"])
			if category.count() == 0:
				raise Exception("No Category with given id.")
			serializer = CategorySerializer(category[0], data=data, partial=True)
			if serializer.is_valid(raise_exception=True):
				serializer.save()
				return Response(
					{"success": True, "message": "Category Updated."},
					status=HTTP_200_OK,
				)
		except Exception as e:
			return Response(
				{"success": False, "message": str(e)}, status=HTTP_406_NOT_ACCEPTABLE
			)


class CategoryRetrievalAPI(RetrieveAPIView):
	"""
	Category Data Retrieval GET API

		Service usage and description : This API is used to retrieve category details.
		Authentication Required : YES
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = CategorySerializer
	queryset = Category.objects.all()


class CategoryListAPI(ListAPIView):
	"""
	Category List GET API

		Service usage and description : This API is used to list category.
		Authentication Required : YES
		Params : {
			"type"  :   "Product",

		}


	"""

	serializer_class = CategorySerializer
	queryset = Category.objects.all()

	def get_queryset(self):
		types = self.request.GET.get("type")
		if types:
			queryset = Category.objects.filter(category_type=types).order_by('priority')
		return queryset

	def get(self, request):
		try:
			queryset = self.filter_queryset(self.get_queryset())
			final_data = []
			for index in queryset:
				temp = {}
				temp['id'] = index.id
				temp['category_type']  = index.category_type
				temp['category_name']  = index.category_name
				domain_name = addr_set()
				if index.category_image != None:
					temp['category_image'] = domain_name + str(index.category_image)
				else:
					temp['category_image'] = ''

				final_data.append(temp)
			return Response(final_data, status=HTTP_200_OK)

		except Exception as e:
			return Response(
				{"success": False, "message": str(e)}, status=HTTP_406_NOT_ACCEPTABLE
			)


class CategoryAll(ListAPIView):
	"""
	Category List GET API

		Service usage and description : This API is used to list category.
		Authentication Required : YES

	"""

	# permission_classes = (
	#     IsAuthenticated,
	 
	# )
	serializer_class = CategorySerializer
	queryset = Category.objects.all()








class ProductCreate(CreateAPIView):
	"""
	Product Creation Post API

		Service Usage and Description : This API is used to create product.
		Authentication Required : YES

		Data : {
			"category"               : "1",  
			"product_name"           : "ABC"
			"product_image"         : ""    (
		}

		Response : {
			"success": True,
		}
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = ProductSerializer
	queryset = Product.objects.all()


class ProductUpdate(UpdateAPIView):
	"""
	Product Update  API View

		Service usage and description : This API is used to update for product.
		Authentication Required : YES

		Data Body for update(Patch method)
	"""

	permission_classes = (IsAuthenticated,)
	serializer_class = ProductSerializer
	def put(self, request):
		try:
			data = request.data
			category = Product.objects.filter(id=data["id"])
			if category.count() == 0:
				raise Exception("No Category with given id.")
			serializer = CategorySerializer(category[0], data=data, partial=True)
			if serializer.is_valid(raise_exception=True):
				serializer.save()
				return Response(
					{"success": True, "message": "Category Updated."},
					status=HTTP_200_OK,
				)
		except Exception as e:
			return Response(
				{"success": False, "message": str(e)}, status=HTTP_406_NOT_ACCEPTABLE
			)


class ProductRetrievalAPI(RetrieveAPIView):
	"""
	Product Data Retrieval GET API

		Service usage and description : This API is used to retrieve product details.
		Authentication Required : YES
	"""

	# permission_classes = (IsAuthenticated,)
	serializer_class = ProductSerializer
	queryset = Product.objects.all()


class ProductSerializers(serializers.ModelSerializer):
    def to_representation(self, instance):
        representation = super(ProductSerializers, self).to_representation(instance)
        representation['category'] = instance.category.category_name
        return representation


    class Meta:
        model = Product
        fields = "__all__"



class ProductListAPI(ListAPIView):
	"""
	Product List GET API

		Service usage and description : This API is used to list product.
		Authentication Required : YES

	"""

	# permission_classes = (
	#     IsAuthenticated,
	 
	# )
	serializer_class = ProductSerializers
	queryset = Product.objects.all()


	





def email_send_module(data):
	try:
		url = "https://api.sendgrid.com/v3/mail/send"
		headers = {'Content-type': 'application/json',
			"Authorization": "Bearer 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",
		   'Accept': 'application/json'}
		data = {
			  "personalizations": [
				{
				  "to": [
					{
					  "email": data['email'],
					},

				  ],
				  "dynamic_template_data": {

				  "name": data['name'],
				  "city":data['city'],
				  "state": data['state'],
				  "company" : data['company'],
				  "enquiry_type"  : data['enquiry_type'],
				  "email"  :data['email'],
				  "phone" : data['phone'],
				  "comment" : data['comment']
				  },

				}
			  ],
			  "from": {
				"email": "singhjaiprakash109@gmail.com",
				"name" : "Qmdspice"
			  },
				"subject": "Hello, World!",
				"template_id":"d-cf75912efc104acda1d1a2b2f6b0bd47",
				"content": [{"type": "text/html", "value": "Heya!"}]
			}
		response= requests.post(url,data=json.dumps(data),headers=headers)
		print(response)
	except Exception as e:
		print(e)




















class SearchMail(APIView):
	"""
	Product Creation & Updation POST API

		Authentication Required     : Yes
		Service Usage & Description : This Api is used to create & update products.

		Data Post: {
			"name"                           : "1"(Send this key in update record case,else it is not required!!)
			"company"                        :  [],
			"city"                           :  [],
			"state"                          :  "Cheese Burst",
			"enquiry_type"                   :  "1",
			"email"                          :  "1",
			"phone"                          :  "",
			"comment"                        :  "",
		}

		Response: {


		}

	"""
	def post(self, request, format=None):
		try:
			data = request.data
			serializer = ContactSerializer(data=data)
			if serializer.is_valid(raise_exception=True):
				start_new_thread(email_send_module, (data,))
				data_info = serializer.save()
				return Response(
					{"success": True, 
					"message": 'Thank you '+data['name']+ ' for contacting us. We will get back to you about your enquiry as soon as possible.'},
					status=HTTP_200_OK,
				)
			else:
				print("sssssssssssssss",serializer.errors)
		except Exception as e:
			return Response(
				{"success": False, "message": str(e)}, status=HTTP_406_NOT_ACCEPTABLE
			)



class CategoryWiseProductListAPI(ListAPIView):
	"""
	Category List GET API

		Service usage and description : This API is used to list category.
		Authentication Required : YES
		Params : {
			"type"  :   "Product",

		}


	"""

	serializer_class = ProductSerializer
	queryset = Product.objects.all()

	def get_queryset(self):
		types = self.request.GET.get("id")
		if types:
			queryset = Product.objects.filter(category_id=types).order_by('-id')
		return queryset

	def get(self, request):
		try:
			queryset = self.filter_queryset(self.get_queryset())
			final_data = []
			for index in queryset:
				temp = {}
				temp['id'] = index.id
				temp['category']  = index.category.category_name
				temp['product_name']  = index.product_name
				temp['product_desc']  = index.product_desc
				domain_name = addr_set()
				if index.product_image != None:
					temp['product_image'] = domain_name + str(index.product_image)
				else:
					temp['product_image'] = ''

				final_data.append(temp)
			return Response(final_data, status=HTTP_200_OK)

		except Exception as e:
			return Response(
				{"success": False, "message": str(e)}, status=HTTP_406_NOT_ACCEPTABLE
			)

class ContactList(ListAPIView):
	"""
	Contact List GET API

		Service usage and description : This API is used to list contact.
		Authentication Required : YES

	"""

	# permission_classes = (
	#     IsAuthenticated,
	 
	# )
	serializer_class = ContactSerializer
	queryset = Contact.objects.all()




class ProductAction(APIView):
	"""
	Product Action POST API

		Authentication Required		: Yes
		Service Usage & Description	: This Api is used to activate or deactivate school.

		Data Post: {
			"id"                   		: "2",
			"active_status"             : "0"
		}

		Response: {

			"success": True, 
			"message": "This school is deactivated now!!"
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
						"Product Id",contact_re, 1)
			if any(err_message.values())==True:
				return Response({
					"success": False,
					"error" : err_message,
					"message" : "Please correct listed errors!!"
					})
			record = Product.objects.filter(id=data["id"])
			if record.count() != 0:
				data["updated_at"] = datetime.now()
				if data["active_status"] == "true":
					info_msg = "This product is activated successfully!!"
				else:
					info_msg = "This product is deactivated successfully!!"
				serializer = \
				ProductSerializer(record[0],data=data,partial=True)
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
						"message": "Product id is not valid to update!!"
					}
					)
			return Response({
						"success": True, 
						"message": info_msg
						})
		except Exception as e:
			print("Product action Api Stucked into exception!!")
			print(e)
			return Response({"success": False, "message": "Error happened!!", "errors": str(e)})
