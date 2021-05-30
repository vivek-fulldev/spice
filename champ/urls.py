from django.contrib import admin
from django.urls import path, include
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from django.conf.urls.static import static
from champ import settings
# from rest_framework_simplejwt import views as jwt_views

schema_view = get_schema_view(
    openapi.Info(title="LAB API DOCS", default_version="v1"),
    public=True
)

urlpatterns = [
    path("", admin.site.urls),
    path("jet/", include("jet.urls", "jet")),
    path("jet/dashboard/", include("jet.dashboard.urls", "jet-dashboard")),
    path(
        "apidocs/",
        schema_view.with_ui("swagger", cache_timeout=0),
        name="schema-swagger-ui"
    ),
    path('api/v1/',include('Configuration.urls')),
    path('api/v1/',include('Customer.urls')),
    path('api/v1/',include('Patient.urls')),
    path('api/v1/',include('Product.urls'))

]
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATICFILES_DIRS)
urlpatterns += static(settings.MEDIA_URL,  document_root=settings.MEDIA_ROOT)