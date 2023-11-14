from django.urls import path

from .views import *

urlpatterns = [
    path('login/', LoginUser.as_view(), name='login'),
    path('logout/', logout_user, name='logout'),

    path('', MainPage.as_view(), name='main_page'),
    
    path('dani/', DaniPage.as_view(), name='dani_page'),
    path('dani/pacient/', DaniPacientPage.as_view(), name='dani_pacient_page'),
    path('dani/likar/', DaniLikarPage.as_view(), name='dani_likar_page'),
    path('dani/viddilennya/', DaniViddilennyaPage.as_view(), name='dani_viddilennya_page'),
    path('dani/diagnoz/', DaniDiagnozPage.as_view(), name='dani_diagnoz_page'),

    path('poisk/', PoiskPage.as_view(), name='poisk_page'),
    path('poisk/<int:page>/', PoiskPage.as_view(), name='poisk_page'),

    path('patient/<int:pk>/', PatientDataPage.as_view(), name='patient_data'),
    path('patient/changedata/<int:pk>/', PatientDataChangePage.as_view(), name='patient_data_change'),
    path('patient/updatedata/<int:pk>/', PatientDataSavePage.as_view(), name='patient_data_save'),
    path('patient/releasedata/<int:pk>/', PatientDataReleasePage.as_view(), name='patient_data_release'),

    path('zvitnist/', ZvitPage.as_view(), name='zvit_page'),
]

from django.contrib import admin
admin_title = 'Стаціонар. Адміністрування'
admin.site.site_header = admin_title
admin.site.index_title = admin_title
admin.site.site_title = admin_title
