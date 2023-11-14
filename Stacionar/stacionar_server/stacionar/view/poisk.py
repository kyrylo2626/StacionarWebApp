from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views.generic import View
from stacionar.forms import *
from stacionar.models import *

# Пошук

class PoiskPage(LoginRequiredMixin, View):
    
    def get(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'

        if 'page' in kwargs:
            context = self.post(request=request, page_number=kwargs['page'])
            return render(request, 'stacionar/poisk/poisk_page_full.html', context=context)
        else:
            context = {
                    'title': 'Пошук пацієнтів:',
                    'form': PoiskForm()
                }

            return render(request, 'stacionar/poisk/poisk_page_empty.html', context=context)
    
    def post(self, request, page_number=1, *args, **kwargs):
        self.redirect_field_name = 'login'

        if request.method == 'POST':
            request.session['last_search'] = request.POST
        else:
            request.POST = request.session['last_search']

        num_pages = 10
        context = {
                'form': PoiskForm(request.POST),
                
                'page_number': page_number,
                'prev_page': page_number - 1,
                'next_page': page_number + 1,
                'first_obj': page_number * num_pages - num_pages
            }

        if request.POST['patinet_name'] != '':
            full_name = request.POST['patinet_name'].replace('.', '').split()
            while len(full_name) < 3:
                full_name.append('')

            list_by_name = []
            index_list = [[0, 1, 2], [0, 2, 1], [1, 2, 0], [1, 0, 2], [2, 1, 0], [2, 0, 1]]
            for i in index_list:
                list_by_name.append(                   
                    Patient.objects.filter(
                        first_name__startswith = full_name[i[0]],
                        last_name__startswith = full_name[i[1]],
                        middle_name__startswith = full_name[i[2]]))

            list_by_name = [i for i in list_by_name if i.count() != 0]
            patinet_list = []
            for i in list_by_name:
                patinet_list.extend(i)
            list_by_name = []
            for i in patinet_list:
                if i not in list_by_name:
                    list_by_name.append(i)
        else:
            list_by_name = list(Patient.objects.all())

        patients = []
        for patient in list_by_name:
            if request.POST['doctor'] != '':
                if int(request.POST['doctor']) != patient.doctor.id:
                    continue
            if request.POST['diagnosis'] != '':
                if int(request.POST['diagnosis']) != patient.diagnosis.id:
                    continue
            if request.POST['department'] != '':
                if int(request.POST['department']) != patient.department.id:
                    continue
            if (
                request.POST['patient_status'] in str(patient.status.id) and
                request.POST['patient_type'] in str(patient.type_patient.id) and
                request.POST['doctor_spec'] in patient.doctor.specialization and
                request.POST['diagnosis_type'] in patient.diagnosis.type_name
            ):
                patients.append(patient)

        if len(patients) > 0:
            context['count_patients'] = len(patients)
            if len(patients) > num_pages:
                context['patients'] = patients[page_number*num_pages-num_pages:page_number*num_pages]
                if isinstance(len(patients)/num_pages, float):
                    context['max_page'] = len(patients) // num_pages + 1
                else:
                    context['max_page'] = len(patients) / num_pages
            else:
                context['patients'] = patients
                context['max_page'] = 1
            context['list'] = 1
        else:
            context['list'] = 0
                        
        if request.method == 'GET':
            return context
        else:
            return render(request, 'stacionar/poisk/poisk_page_full.html', context=context)