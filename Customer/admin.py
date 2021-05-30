from django.contrib import admin
from datetime import datetime
from django.forms.utils import ErrorList
from Configuration.models import *
from Customer.models import CustomerProfile
from import_export.admin import ImportExportModelAdmin

def make_active(modeladmin, request, queryset):
    queryset.update(active_status="1", updated_at=datetime.now())
make_active.short_description = "Move Items to Active"


def make_deactive(modeladmin, request, queryset):
    queryset.update(active_status="0", updated_at=datetime.now())
make_deactive.short_description = "Move Items to Deactive"

@admin.register(CustomerProfile)
class CustomerProfileAdmin(ImportExportModelAdmin):

	exclude = [
		'active_status',
		'created_at',
		'updated_at',
	  ]



	search_fields = [
				  'user_type',
			   ]

	list_display = [
				  'user_type',
				  'area',
				  'emp_code',
				  'password',
				  'created_at', 
				  'updated_at',
				  ]

	actions = [make_active, make_deactive]

	list_per_page = 10

	def has_delete_permission(self, request, obj=None):
		return True

	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_at = datetime.now()
		else:
			obj.updated_at = datetime.now()
		obj.save()




# admin.site.register(CustomerProfile,CustomerProfileAdmin)





