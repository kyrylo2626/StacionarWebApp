from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import View, CreateView
from stacionar.forms import *
from stacionar.models import *

# Заповнення даних

class DaniPage(LoginRequiredMixin, View):
    
    def get(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        context = {'title': 'Додати дані:',}
        return render(request, 'stacionar/dani/dani_page.html', context=context)


class DaniPacientPage(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    redirect_field_name = 'login'
    form_class = DaniPatientForm
    template_name = 'stacionar/dani/dani_pacient_page.html'
    success_url = reverse_lazy('dani_pacient_page')
    extra_context = {'title': 'Додати дані пацієнта:'}
    success_message = 'Пацієнта успішно зареєстровано'


class DaniLikarPage(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    redirect_field_name = 'login'
    form_class = DaniLikarForm
    template_name = 'stacionar/dani/dani_likar_page.html'
    success_url = reverse_lazy('dani_likar_page')
    extra_context = {'title': 'Додати дані лікаря:'}
    success_message = 'Лікаря успішно зареєстровано'


class DaniViddilennyaPage(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    redirect_field_name = 'login'
    form_class = DaniViddilennyaForm
    template_name = 'stacionar/dani/dani_viddilennya_page.html'
    success_url = reverse_lazy('dani_viddilennya_page')
    extra_context = {'title': 'Додати дані відділення:'}
    success_message = 'Відділення успішно зареєстровано'


class DaniDiagnozPage(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    redirect_field_name = 'login'
    form_class = DaniDignozForm
    template_name = 'stacionar/dani/dani_diagnoz_page.html'
    success_url = reverse_lazy('dani_diagnoz_page')
    extra_context = {'title': 'Додати дані діагнозу:'}
    success_message = 'Діагноз успішно зареєстровано'