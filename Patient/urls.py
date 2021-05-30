from django.urls import path, include
from .views import *

urlpatterns = [
    path("patient/create/", PatientCreate.as_view()),
    path("patient/update/", PatientUpdate.as_view()),
    path("patient/list/", PatientListingAPI.as_view()),
    path("patient/retrieve/<int:pk>/", PatientRetrieveAPI.as_view()),
    path("patient/aaaa/", RetrieveAPI.as_view()),
    path("action/patient/", activePatient.as_view()),
    path("patient/retrieves/", RetrievesAPI.as_view()),


    path("split/create/", SplitCreate.as_view()),
    path("split/update/<int:pk>/", SplitUpdate.as_view()),

    path("split/list/", SplitListingAPI.as_view()),
    path("split/retrieve/<int:pk>/", SplitRetrieveAPI.as_view()),
    path("action/split/", SplitAction.as_view()),

    path("sample/list/", SampleListingAPI.as_view()),
    path("action/sample/", SampleAction.as_view()),
    path("sample/create/", SampleCreate.as_view()),

    path("paid/create/", AmountCreate.as_view()),



    # Inscusion Out
    path("inscusion/list/", InscusionListingAPI.as_view()),
    path("action/inscusion/", InscusionAction.as_view()),
    path("inscusion/create/", InscusionCreate.as_view()),
    path("inscusion/retrieve/<int:pk>/", InscusionRetrieveAPI.as_view()),
    path("inscusion/update/<int:pk>/", InscusionUpdate.as_view()),


]



