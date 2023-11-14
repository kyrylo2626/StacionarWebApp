from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views.generic import View
from datetime import datetime, timedelta
from stacionar.forms import *
from stacionar.models import *

# Звітність

class ZvitPage(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        context = {
                'title': 'Звітність:',
                'form': ZvitnistForm()
            }

        return render(request, 'stacionar/zvit/zvit_page_empty.html', context=context)


    def post(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        context = {
                'title': 'Звітність:',
                'form': ZvitnistForm()
            }

        if 'diagnosis_type' in request.POST and request.POST['diagnosis_type'] != '':
            diagnosis_type = request.POST['diagnosis_type']
            context['diagnosis_type'] = diagnosis_type
            zvit_data = {}

            #1 Всього на лікуванні
            zvit_data['patient_all'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні').count()
            #2 Планових
            zvit_data['patient_plan'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні',
                type_patient__type_patient='Плановий').count()
            #3 Лікарня
            zvit_data['patient_plan_lik'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні',
                type_patient__type_patient='Плановий',
                direction__direction='Лікарня').count()
            #4 Військомат
            zvit_data['patient_plan_voen'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні',
                type_patient__type_patient='Плановий',
                direction__direction='Військомат').count()
            #5 Ургентний
            zvit_data['patient_ur'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні',
                type_patient__type_patient='Ургентний').count()
            #6 До 17
            zvit_data['patient_ur_l17'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні',
                type_patient__type_patient='Ургентний',
                date_of_birth__gt=datetime.now()-timedelta(days=17*365)).count()
            #7 Після 60
            zvit_data['patient_ur_g60'] = Patient.objects.filter(
                diagnosis__type_name=diagnosis_type,
                status__status='На лікуванні',
                type_patient__type_patient='Ургентний',
                date_of_birth__lt=datetime.now()-timedelta(days=60*365)).count()

            context['zvit_data'] = zvit_data
            return render(request, 'stacionar/zvit/zvit_page_full.html', context=context)
        else:
            return render(request, 'stacionar/zvit/zvit_page_empty.html', context=context)