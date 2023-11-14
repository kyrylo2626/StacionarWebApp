from django.contrib import admin
from .models import *



class PatientAdmin(admin.ModelAdmin):
    list_display = ('id', 'last_name', 'first_name', 'middle_name', 'status', 'diagnosis', 'time_create')
    list_display_links = ('id', 'last_name', 'first_name', 'middle_name')
    search_fields = ('last_name', 'first_name', 'middle_name', 'diagnosis')
    list_filter = ('status', 'time_create')



class DiagnosesAdmin(admin.ModelAdmin):
    list_display = ('id', 'type_name', 'name')
    list_display_links = ('id', 'name')
    search_fields = ('type_name', 'name')
    list_filter = ('type_name',)



class DoctorsAdmin(admin.ModelAdmin):
    list_display = ('id', 'last_name', 'first_name', 'middle_name', 'specialization')
    list_display_links = ('id', 'last_name', 'first_name', 'middle_name')
    search_fields = ('last_name', 'first_name', 'middle_name', 'specialization')
    list_filter = ('specialization',)



class DepartmentsAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'number')
    list_display_links = ('id', 'name', 'number')
    search_fields = ('name', 'number')
    list_filter = ('name',)



class StatusAdmin(admin.ModelAdmin):
    list_display = ('id', 'status')
    list_display_links = ('id', 'status')



class TypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'type_patient')
    list_display_links = ('id', 'type_patient')



class DirectionAdmin(admin.ModelAdmin):
    list_display = ('id', 'direction')
    list_display_links = ('id', 'direction')



class ResultAdmin(admin.ModelAdmin):
    list_display = ('id', 'result')
    list_display_links = ('id', 'result')



class PaperAdmin(admin.ModelAdmin):
    list_display = ('id', 'patient_paper')
    list_display_links = ('id', 'patient_paper')



admin.site.register(Patient, PatientAdmin)
admin.site.register(Diagnoses, DiagnosesAdmin)
admin.site.register(Doctors, DoctorsAdmin)
admin.site.register(Departments, DepartmentsAdmin)
admin.site.register(Status, StatusAdmin)
admin.site.register(Type, TypeAdmin)
admin.site.register(Direction, DirectionAdmin)
admin.site.register(Result, ResultAdmin)
admin.site.register(Paper, PaperAdmin)

