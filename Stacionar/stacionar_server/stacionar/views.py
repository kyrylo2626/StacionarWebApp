from django.contrib.auth.views import LoginView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import logout
from django.shortcuts import render, redirect
from django.views.generic import View
from .forms import *
from .models import *

from .view.patient import *
from .view.poisk import *
from .view.dani import *
from .view.zvit import *





class LoginUser(LoginView):
    form_class = LoginUserForm
    template_name = 'stacionar/user/login.html'
    login_url=None

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Авторизація'
        return context

    def get_success_url(self):
        url = self.get_redirect_url()
        if url:
            return url
        else:
            return reverse("main_page")


def logout_user(request):
    logout(request)
    return redirect('login')



class MainPage(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        self.redirect_field_name = 'login'
        context = {'title': 'Стаціонар. Приймальне відділення.',}
        return render(request, 'stacionar/main_page.html', context=context)

















