from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.utils import timezone
from django.views.generic import View, CreateView, DetailView
from datetime import datetime, date
from stacionar.forms import *
from stacionar.models import *

# Дані пацієнта

class PatientDataPage(LoginRequiredMixin, DetailView):
    redirect_field_name = 'login'
    model = Patient
    template_name = 'stacionar/patient/patient_data.html'
    context_object_name = 'patient'

    def get_queryset(self):
        return Patient.objects.filter(pk=self.kwargs['pk'])



class PatientDataChangePage(LoginRequiredMixin, CreateView):
    redirect_field_name = 'login'
    form_class = DaniPatientForm
    template_name = 'stacionar/patient/patient_data_change.html'
    success_url = reverse_lazy('patient_data')
    extra_context = {'title': 'Змінити дані пацієнта:'}

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        patient_data = Patient.objects.filter(pk=self.kwargs['pk'])
        patients = list(patient_data.values())[0]
        patients['status'] = patients['status_id']
        patients['type_patient'] = patients['type_patient_id']
        patients['direction'] = patients['direction_id']
        patients['result'] = patients['result_id']
        patients['patient_paper'] = patients['patient_paper_id']
        patients['diagnosis'] = patients['diagnosis_id']
        patients['department'] = patients['department_id']
        patients['doctor'] = patients['doctor_id']
        patients['date_of_birth'] = patients['date_of_birth'].strftime('%Y-%m-%d')
        if patients['time_of_beginning'] is not None:
            patients['time_of_beginning'] = patients['time_of_beginning'].strftime('%Y-%m-%d %H:%M:%S')
        context['form'] = DaniPatientForm(patients)
        return context



class PatientDataSavePage(LoginRequiredMixin, View):

    def post(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        patient = Patient.objects.get(pk=kwargs['pk'])
        for field in request.POST:
            if self.get_data(patient, field):
                if isinstance(self.get_data(patient, field), str):
                    if self.get_data(patient, field) != request.POST[field]:
                        self.set_data(patient, field, request.POST[field])
                elif isinstance(self.get_data(patient, field), date):
                    if self.get_data(patient, field).strftime("%Y-%m-%d") != request.POST[field]:
                        self.set_data(patient, 'date_of_birth', datetime.strptime(request.POST['date_of_birth'], '%Y-%m-%d').date())
                elif isinstance(self.get_data(patient, field), datetime):
                    if self.get_data(patient, field).strftime("%Y-%m-%dT%H:%M:%S") != request.POST[field]:
                        self.set_data(patient, 'time_of_beginning', datetime.strptime(request.POST['time_of_beginning'], '%Y-%m-%dT%H:%M:%S'))
                else:
                    if self.get_data(patient, field).id != request.POST[field]:
                        sub_data = type(self.get_data(patient, field)).objects.get(pk=request.POST[field])
                        self.set_data(patient, field, sub_data)
                        
        patient.save()

        return HttpResponseRedirect('/patient/' + str(kwargs['pk']))

    def get_data(self, obj, attr):
        try:
            return obj.__getattribute__(attr)
        except AttributeError:
            return False

    def set_data(self, obj, attr, value):
        obj.__setattr__(attr, value)



class PatientDataReleasePage(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        context = {
                'title': 'Виписати пацієнта:',
                'patient': Patient.objects.get(pk=kwargs['pk']),
                'form': PatientReleaseForm()
            }
        return render(request, 'stacionar/patient/patient_data_release.html', context=context)

    def post(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        patient = Patient.objects.get(pk=kwargs['pk'])
        patient.status = Status.objects.get(status='Виписано')
        patient.result = Result.objects.get(pk=request.POST['result'])
        patient.patient_paper = Paper.objects.get(pk=request.POST['patient_paper'])
        patient.time_of_ending = datetime.now(tz=timezone.utc)                
        patient.save()

        return HttpResponseRedirect('/patient/' + str(kwargs['pk']))