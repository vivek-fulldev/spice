from rest_framework.status import (
    HTTP_200_OK,
    HTTP_406_NOT_ACCEPTABLE,
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_500_INTERNAL_SERVER_ERROR,
)
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import (
    CreateAPIView,
    ListAPIView,
    RetrieveAPIView,
    RetrieveUpdateDestroyAPIView,
    UpdateAPIView,
    DestroyAPIView,
)
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User, Group
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate

from django.db.models import Q
from django.db import transaction
from django.http import Http404
from Configuration.models import *
from rest_framework import serializers
from Customer.api_packages import *
from Customer.models import *
from Patient.models import *


class TypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = UserType
		fields = '__all__'


class AreaSerializer(serializers.ModelSerializer):
	class Meta:
		model = AreaMaster
		fields = '__all__'


        

class UserTypeCreate(CreateAPIView):
    """
    UserType Create POST API

        Service Usage and Description : This API is used to create user type.
        Authentication Required: YES
    """

    permission_classes = (IsAuthenticated,)
    serializer_class = TypeSerializer
    queryset = UserType.objects.all()


class UserTypeUDAPI(UpdateAPIView, DestroyAPIView):
    """
    User Type Update & Delete API View

        Service usage and description : This API is used to update or delete user type info.
        Authentication Required : YES

        Data Body for update(Patch method)
    """

    permission_classes = (
        IsAuthenticated,
    )
    serializer_class = TypeSerializer
    queryset = UserType.objects.all()



class UserTypeListingAPI(ListAPIView):
    """
    User Type List GET API

        Service usage and description : This API is used to list user type.
        Authentication Required : YES

    """

    permission_classes = (
        IsAuthenticated,
    )
    serializer_class = TypeSerializer
    queryset = UserType.objects.all()


class activeUserType(ListAPIView):
    """
    User Type List GET API

        Service usage and description : This API is used to list user type.
        Authentication Required : YES

    """

    permission_classes = (
        IsAuthenticated,
    )
    serializer_class = TypeSerializer
    queryset = UserType.objects.filter(active_status=1)

class UserTypeRetrieveAPI(RetrieveAPIView):
    """
    UserType Data Retrieval GET API

        Service usage and description : This API is used to retrieve user type details.
        Authentication Required : YES
    """

    permission_classes = (IsAuthenticated,)
    serializer_class = TypeSerializer
    queryset = UserType.objects.all()


class UserTypeAction(APIView):
    """
    UserType Action POST API

        Authentication Required     : Yes
        Service Usage & Description : This Api is used to activate or deactivate Area.

        Data Post: {
            "id"                        : "2",
            "active_status"             : "0"
        }

        Response: {

            "success": True, 
            "message": "Area is deactivated now!!",
            "data": final_result
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
                        "UserType Id",contact_re, 1)
            if any(err_message.values())==True:
                return Response({
                    "success": False,
                    "error" : err_message,
                    "message" : "Please correct listed errors!!"
                    })
            record = UserType.objects.filter(id=data["id"])
            if record.count() != 0:
                data["updated_at"] = datetime.now()
                if data["active_status"] == "true":
                    info_msg = "UserType is activated successfully!!"
                else:
                    info_msg = "UserType is deactivated successfully!!"
                serializer = \
                TypeSerializer(record[0],data=data,partial=True)
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
                        "message": "UserType id is not valid to update!!"
                    }
                    )
            final_result = []
            final_result.append(serializer.data)
            return Response({
                        "success": True, 
                        "message": info_msg,
                        "data": final_result,
                        })
        except Exception as e:
            print("UserType action Api Stucked into exception!!")
            print(e)
            return Response({"success": False, "message": "Error happened!!", "errors": str(e)})

class AreaCreate(CreateAPIView):
    """
   	Area Create POST API

        Service Usage and Description : This API is used to create area.
        Authentication Required: YES
    """

    permission_classes = (IsAuthenticated,)
    serializer_class = AreaSerializer
    queryset = AreaMaster.objects.all()


class AreaUDAPI(UpdateAPIView, DestroyAPIView):
    """
    Area Update & Delete API View

        Service usage and description : This API is used to update or delete area info.
        Authentication Required : YES

        Data Body for update(Patch method)
    """

    permission_classes = (
        IsAuthenticated,
    )
    serializer_class = AreaSerializer
    queryset = AreaMaster.objects.all()



class AreaListingAPI(ListAPIView):
    """
    Area List GET API

        Service usage and description : This API is used to list area.
        Authentication Required : YES

    """

    permission_classes = (
        IsAuthenticated,
    )
    serializer_class = AreaSerializer
    queryset = AreaMaster.objects.all()


class activeArea(ListAPIView):
    """
    Area List GET API

        Service usage and description : This API is used to list area.
        Authentication Required : YES

    """

    permission_classes = (
        IsAuthenticated,
    )
    serializer_class = AreaSerializer
    queryset = AreaMaster.objects.filter(active_status=1)


class LocationListingAPI(ListAPIView):
    """
    Area List GET API

        Service usage and description : This API is used to list area.
        Authentication Required : YES

    """


    serializer_class = AreaSerializer
    queryset = AreaMaster.objects.filter(active_status=1)


class AreaRetrieveAPI(RetrieveAPIView):
    """
    UserType Data Retrieval GET API

        Service usage and description : This API is used to retrieve user type details.
        Authentication Required : YES
    """

    permission_classes = (IsAuthenticated,)
    serializer_class = AreaSerializer
    queryset = AreaMaster.objects.all()


class AreaAction(APIView):
    """
    Area Action POST API

        Authentication Required     : Yes
        Service Usage & Description : This Api is used to activate or deactivate Area.

        Data Post: {
            "id"                        : "2",
            "active_status"             : "0"
        }

        Response: {

            "success": True, 
            "message": "Area is deactivated now!!",
            "data": final_result
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
                        "Area Id",contact_re, 1)
            if any(err_message.values())==True:
                return Response({
                    "success": False,
                    "error" : err_message,
                    "message" : "Please correct listed errors!!"
                    })
            record = AreaMaster.objects.filter(id=data["id"])
            if record.count() != 0:
                data["updated_at"] = datetime.now()
                if data["active_status"] == "true":
                    info_msg = "Area is activated successfully!!"
                else:
                    info_msg = "Area is deactivated successfully!!"
                serializer = \
                AreaSerializer(record[0],data=data,partial=True)
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
                        "message": "Area id is not valid to update!!"
                    }
                    )
            final_result = []
            final_result.append(serializer.data)
            return Response({
                        "success": True, 
                        "message": info_msg,
                        "data": final_result,
                        })
        except Exception as e:
            print("Area action Api Stucked into exception!!")
            print(e)
            return Response({"success": False, "message": "Error happened!!", "errors": str(e)})


class CountData(APIView):
    """
    Count POST API

        Authentication Required     : Yes
        Service Usage & Description : This Api is used to count all data.

        Data Post: {

        }

        Response: {


        }

    """
    permission_classes = (IsAuthenticated,)
    def get(self, request, format=None):
        try:
            mutable = request.POST._mutable
            request.POST._mutable = True
            from django.db.models import Q
            areadata = AreaMaster.objects.filter()
            usertypedata = UserType.objects.filter()
            cust = CustomerProfile.objects.filter()
            patient = Patient.objects.filter()
            splitdata = SplitTest.objects.filter()
            sampledata = SampleCollection.objects.filter()
            inscusiondata = InscusionOut.objects.filter()


            return Response({
                        "success": True, 
                        "areadata": areadata.count(),
                        "usertypedata": usertypedata.count(),
                        "customer":cust.count(),
                        "patient":patient.count(),
                        "split": splitdata.count(),
                        "sample" : sampledata.count(),
                        "inscusion" : inscusiondata.count()

                        })
        except Exception as e:
            print("Area action Api Stucked into exception!!")
            print(e)
            return Response({"success": False, "message": "Error happened!!", "errors": str(e)})



class UserNameWiseArea(APIView):
    """
    Count POST API

        Authentication Required     : Yes
        Service Usage & Description : This Api is used to count all data.

        Data Post: {
                "username" :
        }

        Response: {


        }

    """
   # permission_classes = (IsAuthenticated,)
    def post(self, request, format=None):
        try:
            mutable = request.POST._mutable
            request.POST._mutable = True
            from django.db.models import Q
            data = request.data
            locationdata = CustomerProfile.objects.filter(username=data['username'])
            final_result = []
            if locationdata.count() > 0:
                dic = {}
                dic['id'] = locationdata[0].area_id
                dic['area'] = AreaMaster.objects.filter(id=locationdata[0].area_id)[0].area
                final_result.append(dic)
                print(final_result)
                return Response({
                    "success": True, 
                    "data" : final_result
                    })
            else:
                return Response({
                    "success": True, 
                    "data" : final_result
                    })
        except Exception as e:
            print("Area Api Stucked into exception!!")
            print(e)
            return Response({"success": False, "message": "Error happened!!", "errors": str(e)})