from django.db import models

# Create your models here.


class AreaMaster(models.Model):
    area = models.CharField(
        max_length=100, 
        verbose_name='Location')
    active_status = models.BooleanField(
        default=1,
        verbose_name="Is Active")
    created_at = models.DateTimeField(
        auto_now_add=True,
        blank=True,
        null=True,
        verbose_name='Creation Date')
    updated_at = models.DateTimeField(
        blank=True,
        null=True,
        verbose_name='Updation Date')

    class Meta:
        verbose_name = 'Area'
        verbose_name_plural = 'Area'
        ordering = ['area']

    def __str__(self):
        return self.area



class UserType(models.Model):
    user_type = models.CharField(
        max_length=100, 
        verbose_name='User Type')
    active_status = models.BooleanField(
        default=1,
        verbose_name="Is Active")
    created_at = models.DateTimeField(
        auto_now_add=True,
        blank=True,
        null=True,
        verbose_name='Creation Date')
    updated_at = models.DateTimeField(
        blank=True,
        null=True,
        verbose_name='Updation Date')

    class Meta:
        verbose_name = 'User Type'
        verbose_name_plural = 'User Type'
        ordering = ['user_type']

    def __str__(self):
        return self.user_type