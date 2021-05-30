from django.urls import path, include
from .views import *

urlpatterns = [
 
    # User Type
    path("usertype/create/", UserTypeCreate.as_view()),
    path("usertype/update/<int:pk>/", UserTypeUDAPI.as_view()),
    path("usertype/retrieve/<int:pk>/", UserTypeRetrieveAPI.as_view()),
    path("usertype/list/", UserTypeListingAPI.as_view()),
    path("action/user_type/", UserTypeAction.as_view()),
    path("active/user_type/", activeUserType.as_view()),


    # Area
    path("area/create/", AreaCreate.as_view()),
    path("area/update/<int:pk>/", AreaUDAPI.as_view()),
    path("area/retrieve/<int:pk>/", AreaRetrieveAPI.as_view()),
    path("area/list/", AreaListingAPI.as_view()),
    path("action/area/", AreaAction.as_view()),
    path("location/list/", LocationListingAPI.as_view()),
    path("active/area/", activeArea.as_view()),
    path("count/data/",CountData.as_view()),
    path("location/username/", UserNameWiseArea.as_view()),

]
