from django.contrib import admin
from Product.models import *
from datetime import datetime

class ProductAdmin(admin.ModelAdmin):
	exclude = [
		'active_status',
		'created_at',
		'updated_at',
	  ]

	list_filter = [

		]

	search_fields = [
	  'pcombo_name',
	  ]

	list_display = [
	  'category',
	  'product_name',
	  'image',
	  'active_status',
	  ]


	def has_delete_permission(self, request, obj=None):
		return True

	def has_add_permission(self, request, obj=None):
		return True

	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_at = datetime.now()
		else:
			obj.updated_at = datetime.now()
		obj.save()



class CategoryAdmin(admin.ModelAdmin):
	exclude = [
		'active_status',
		'created_at',
		'updated_at',
	  ]

	search_fields = [

	  ]

	list_display = [
	  'category_type',
	  'category_name',
	  'active_status',
	  ]


	list_per_page = 10

	def has_delete_permission(self, request, obj=None):
		return True

	def has_add_permission(self, request, obj=None):
		return True

	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_at = datetime.now()
		else:
			obj.updated_at = datetime.now()
		obj.save()




class ContactAdmin(admin.ModelAdmin):
	exclude = [
		'active_status',
		'created_at',
		'updated_at',
	  ]

	search_fields = [

	  ]

	list_display = [
	  'name',
	  'company',
	  'city',
	  'state',
	  'enquiry_type',
	  'email',
	  'phone',
	  'comment',
	  ]


	list_per_page = 10

	def has_delete_permission(self, request, obj=None):
		return True

	def has_add_permission(self, request, obj=None):
		return True

	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_at = datetime.now()
		else:
			obj.updated_at = datetime.now()
		obj.save()

admin.site.register(Category,CategoryAdmin)
admin.site.register(Product,ProductAdmin)
admin.site.register(Contact,ContactAdmin)