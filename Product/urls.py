from django.urls import path, include
from .views import *

urlpatterns = [
    path("category/create/", CategoryCreate.as_view()),
    path("category/update/", CategoryUpdate.as_view()),
    path("category/retrieval/<int:pk>/", CategoryRetrievalAPI.as_view()),
    path("category/list/", CategoryListAPI.as_view()),
 	path("category/all/", CategoryAll.as_view()),


    path("product/create/", ProductCreate.as_view()),
    path("product/update/", ProductUpdate.as_view()),
    path("product/retrieval/<int:pk>/", ProductRetrievalAPI.as_view()),
    path("product/list/", ProductListAPI.as_view()),
    path("product/action/", ProductAction.as_view()),


    path("mail/", SearchMail.as_view()),
    path("contact/list/", ContactList.as_view()),


    path("categorywiseproduct/", CategoryWiseProductListAPI.as_view()),


]


