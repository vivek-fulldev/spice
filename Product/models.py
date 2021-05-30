from django.db import models
from django.utils.safestring import mark_safe
from champ.settings import MEDIA_URL



class Category(models.Model):
	status_choice = (
        ("product", "Product"),
        ("other", "Other"),
    )
	category_type = models.CharField(
        choices=status_choice,
        max_length=50,
        null=True,
        blank=True,
        verbose_name="Status",
    )
	category_name = models.CharField(
		max_length=50, 
		verbose_name='Category Name')
	
	category_image =  models.ImageField(
		upload_to='category_image/', 
		verbose_name='Image', 
		null=True,blank=True)

	priority = models.PositiveIntegerField(
		null=True, 
		blank=True, 
		verbose_name='Priority')
	active_status = models.BooleanField(
		default=1,
		verbose_name='Is Active')

	created_at = models.DateTimeField(
		auto_now_add=True,
		verbose_name='Creation Date & Time')
	
	updated_at = models.DateTimeField(
		null=True, 
		blank=True, 
		verbose_name='Updation Date & Time')

	class Meta:
		verbose_name = 'Category'
		verbose_name_plural = ' Categories'


	def __str__(self):
		if self.category_name:
			return self.category_name



class Product(models.Model):
	category = models.ForeignKey(
		Category, 
		related_name='Product_category',
		on_delete=models.CASCADE,
		verbose_name='Category',
		limit_choices_to={'active_status':'1'})
	product_name = models.CharField(
		max_length=100, 
		verbose_name='Product Name')
	product_image =  models.ImageField(
		upload_to='product_image/', 
		verbose_name='Image', 
		null=True,blank=True)
	product_desc = models.TextField(
		verbose_name='Product Description',
		null=True, blank=True)

	active_status = models.BooleanField(
		default=1, 
		verbose_name='Is Active')
	created_at = models.DateTimeField(
		auto_now_add=True,
		verbose_name='Creation Date & Time')
	updated_at = models.DateTimeField(
		null=True, 
		blank=True, 
		verbose_name='Updation Date & Time')

	def image(self):
		if self.product_image:
			return mark_safe('<img src='+MEDIA_URL+'%s width="50" height="50" />' % (self.product_image))
		return 'No Image'
	image.short_description = 'Product Image'

	class Meta:
		verbose_name = 'Product'
		verbose_name_plural = '  Products'

	def __str__(self):
		return self.product_name




class Contact(models.Model):
	name = models.CharField(
		max_length=100, 
		verbose_name='Name')
	company = models.CharField(
		max_length=100, 
		verbose_name='Company')
	city = models.CharField(
		max_length=100, 
		verbose_name='City')
	state = models.CharField(
		max_length=100, 
		verbose_name='State')
	enquiry_type = models.CharField(
		max_length=100, 
		verbose_name='Enquiry Type')
	email = models.CharField(
		max_length=100, 
		verbose_name='Email')
	phone = models.CharField(
		max_length=100, 
		verbose_name='Phone')
	comment = models.CharField(
		max_length=100, 
		verbose_name='Comment')
	active_status = models.BooleanField(
		default=1, 
		verbose_name='Is Active')
	created_at = models.DateTimeField(
		auto_now_add=True,
		verbose_name='Creation Date & Time')
	updated_at = models.DateTimeField(
		null=True, 
		blank=True, 
		verbose_name='Updation Date & Time')


	class Meta:
		verbose_name = 'Contact'
		verbose_name_plural = '  Contact'

	def __str__(self):
		return self.name