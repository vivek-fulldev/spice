# from django.contrib import admin
# from datetime import datetime
# from django.forms.utils import ErrorList
# from Patient.models import Patient,SplitTest,SampleCollection,InscusionOut,PaidAmount

# def make_active(modeladmin, request, queryset):
#     queryset.update(active_status="1", updated_at=datetime.now())
# make_active.short_description = "Move Items to Active"


# def make_deactive(modeladmin, request, queryset):
#     queryset.update(active_status="0", updated_at=datetime.now())
# make_deactive.short_description = "Move Items to Deactive"

# from import_export.admin import ImportExportModelAdmin



# @admin.register(Patient)
# class PatientAdmin(ImportExportModelAdmin):
# 	exclude = [
# 		'active_status',
# 		'created_at',
# 		'updated_at',
# 	  ]
# 	search_fields = [
# 				  'patient_id',
# 			   ]

# 	list_display = [
# 				  'patient_id',
# 				  'location',
# 				  'patient_name',
# 				  'phone',
# 				  'created_at', 
# 				  'updated_at',
# 				  ]

# 	actions = [make_active, make_deactive]
# 	list_per_page = 10
# 	def has_delete_permission(self, request, obj=None):
# 		return True
# 	def save_model(self, request, obj, form, change):
# 		if not change:
# 			obj.created_at = datetime.now()
# 		else:
# 			obj.updated_at = datetime.now()
# 		obj.save()


# @admin.register(SplitTest)
# class SplitTestAdmin(ImportExportModelAdmin):

# 	exclude = [
# 		'active_status',
# 		'created_at',
# 		'updated_at',
# 	  ]



# 	search_fields = [
# 				  'patient_id',
# 			   ]

# 	list_display = [
# 				  'patient_id',
# 				  'patient_name',
# 				  'phone',
# 				  'created_at', 
# 				  'updated_at',
# 				  ]

# 	actions = [make_active, make_deactive]

# 	list_per_page = 10

# 	def has_delete_permission(self, request, obj=None):
# 		return True

# 	def save_model(self, request, obj, form, change):
# 		if not change:
# 			obj.created_at = datetime.now()
# 		else:
# 			obj.updated_at = datetime.now()
# 		obj.save()





# @admin.register(SampleCollection)
# class SampleCollectionAdmin(ImportExportModelAdmin):

# 	exclude = [
# 		'active_status',
# 		'created_at',
# 		'updated_at',
# 	  ]



# 	search_fields = [
# 				  'patient_id',
# 			   ]

# 	list_display = [
# 				  'patient_id',
# 				  'patient_name',
# 				  'phone',
# 				  'created_at', 
# 				  'updated_at',
# 				  ]

# 	actions = [make_active, make_deactive]

# 	list_per_page = 10

# 	def has_delete_permission(self, request, obj=None):
# 		return True

# 	def save_model(self, request, obj, form, change):
# 		if not change:
# 			obj.created_at = datetime.now()
# 		else:
# 			obj.updated_at = datetime.now()
# 		obj.save()



# @admin.register(InscusionOut)
# class InscusionOutAdmin(ImportExportModelAdmin):

# 	exclude = [
# 		'active_status',
# 		'created_at',
# 		'updated_at',
# 	  ]



# 	search_fields = [
# 				  'patient_id',
# 			   ]

# 	list_display = [
# 				  'patient_id',
# 				  'patient_name',
# 				  'phone',
# 				  'created_at', 
# 				  'updated_at',
# 				  ]

# 	actions = [make_active, make_deactive]

# 	list_per_page = 10

# 	def has_delete_permission(self, request, obj=None):
# 		return True

# 	def save_model(self, request, obj, form, change):
# 		if not change:
# 			obj.created_at = datetime.now()
# 		else:
# 			obj.updated_at = datetime.now()
# 		obj.save()

# @admin.register(PaidAmount)
# class PaidAmountAdmin(ImportExportModelAdmin):

# 	exclude = [
# 		'active_status',
# 		'created_at',
# 		'updated_at',
# 	  ]



# 	search_fields = [
# 				  'patient_id',
# 			   ]

# 	list_display = [
# 				  'patient_id',
# 				  'created_at', 
# 				  'updated_at',
# 				  ]

# 	actions = [make_active, make_deactive]

# 	list_per_page = 10

# 	def has_delete_permission(self, request, obj=None):
# 		return True

# 	def save_model(self, request, obj, form, change):
# 		if not change:
# 			obj.created_at = datetime.now()
# 		else:
# 			obj.updated_at = datetime.now()
# 		obj.save()





# # admin.site.register(Patient,PatientAdmin)
# # admin.site.register(SplitTest,SplitTestAdmin)
# # admin.site.register(SampleCollection,SampleCollectionAdmin)
# # admin.site.register(InscusionOut,InscusionOutAdmin)
# # admin.site.register(PaidAmount,PaidAmountAdmin)
