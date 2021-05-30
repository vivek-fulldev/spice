from django.urls import path, include
from .views import *

urlpatterns = [
    path("signin/", SignIn.as_view()),
    path("signout/", Logout.as_view()),
    path("user/create/", UserCreate.as_view()),
    path("user/list/", UserListingAPI.as_view()),
    path("user/retrieve/<int:pk>/", UserRetrieveAPI.as_view()),
    path("action/user/", activeUser.as_view()),





]



