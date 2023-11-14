from django import forms
from django.contrib.auth.forms import AuthenticationForm
from .models import *



class LoginUserForm(AuthenticationForm):
    username = forms.CharField(label='Login', widget=forms.TextInput(attrs={'class': 'input_field', 'style': 'width: 100%',  'placeholder': 'Логін'}))
    password = forms.CharField(label='Password', widget=forms.PasswordInput(attrs={'class': 'input_field', 'style': 'width: 100%',  'placeholder': 'Пароль'}))



class PoiskForm(forms.ModelForm):

    class Meta:
        model = Patient
        fields = ['department']
        widgets = {
            'department': forms.Select(attrs={'id': 'department', 'style': 'width: 82%'}),
            }


    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['department'].required = False
        self.fields['doctor'].choices = self.doc_list()
        self.fields['diagnosis'].choices = self.diagnosis_list()

        
    patinet_name = forms.CharField(
        required=False,
        max_length=255,
        widget=forms.TextInput(attrs={'class': 'input_field', 'style': "width: 82%", 'placeholder': "ПІБ пацієнта"}))

    patient_status = forms.ModelChoiceField(
        required=False,
        queryset=Status.objects.all(),
        empty_label='Оберіть статус пацієнта',
        widget=forms.Select(attrs={'class': 'select_element', 'style': 'width: 70%'}))
    patient_type = forms.ModelChoiceField(
        required=False,
        queryset=Type.objects.all(),
        empty_label='Оберіть тип пацієнта',
        widget=forms.Select(attrs={'class': 'select_element', 'style': 'width: 70%'}))

    @staticmethod
    def doc_list():
        doc_choises = [('', '')]
        for spec in Doctors.objects.values_list('specialization', flat=True).distinct().order_by('specialization'):
            sub_list = []
            for doc in Doctors.objects.all().order_by('last_name'):
                if spec == doc.specialization:
                    sub_list.append((doc.id, doc))
            doc_choises.append((spec, tuple(sub_list)))

        return doc_choises

    doctor = forms.ChoiceField(
        required=False,
        choices=doc_list(),
        widget=forms.Select(attrs={'id': 'doctor', 'style': 'width: 82%'}))
    doctor_spec = forms.ModelChoiceField(
        required=False,
        queryset=Doctors.objects.values_list('specialization', flat=True).distinct().order_by('specialization'),
        empty_label='Оберіть спеціалізацію',
        widget=forms.Select(attrs={'id': 'doctor_spec', 'class': 'select_element', 'style': 'width: 70%'}))

    @staticmethod
    def diagnosis_list():
        diagnosis_choises = [('', '')]
        for type in Diagnoses.objects.values_list('type_name', flat=True).distinct().order_by('type_name'):
            sub_list = []
            for diagnosis in Diagnoses.objects.all().order_by('name'):
                if type == diagnosis.type_name:
                    sub_list.append((diagnosis.id, diagnosis.name))
            diagnosis_choises.append((type, tuple(sub_list)))

        return diagnosis_choises

    diagnosis = forms.ChoiceField(
        required=False,
        choices=diagnosis_list(),
        widget=forms.Select(attrs={'id': 'diagnosis', 'style': 'width: 82%'}))
    diagnosis_type = forms.ModelChoiceField(
        required=False,
        queryset=Diagnoses.objects.values_list('type_name', flat=True).distinct().order_by('type_name'),
        empty_label='Оберіть клас діагнозу',
        widget=forms.Select(attrs={'id': 'diagnosis_type', 'class': 'select_element', 'style': 'width: 70%'}))



class ZvitnistForm(forms.Form):

    diagnosis_type = forms.ModelChoiceField(
        empty_label = 'Оберіть клас діагнозу',
        queryset=Diagnoses.objects.values_list('type_name', flat=True).distinct().order_by('type_name'),
        widget=forms.Select(attrs={'id': 'diagnosis_type', 'style': 'width: 62%'}))





class DaniDignozForm(forms.ModelForm):
    
    class Meta:
        model = Diagnoses
        fields = ['type_name', 'name']
        widgets = {
            'type_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 77%", 'placeholder': "Клас діагноза"}),
            'name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 68%", 'placeholder': "Найменування діагноза"})
        }


class DaniViddilennyaForm(forms.ModelForm):

    class Meta:
        model = Departments
        fields = ['name', 'number']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 73%", 'placeholder': "Найменування відділення"}),
            'number': forms.NumberInput(attrs={'class': 'input_field', 'style': "width: 52%", 'placeholder': "Номер відділення"})
        }


class DaniLikarForm(forms.ModelForm):

    class Meta:
        model = Doctors
        fields = ['first_name', 'last_name', 'middle_name', 'specialization']
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 90%", 'placeholder': "Ім'я лікаря"}),
            'last_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 80%", 'placeholder': "Прізвище лікаря"}),
            'middle_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 80%", 'placeholder': "По-батькові лікаря"}),
            'specialization': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 79%", 'placeholder': "Спеціалізація лікаря"}),
        }


class DaniPatientForm(forms.ModelForm):

    class Meta:
        model = Patient
        fields = [
            'first_name', 'last_name', 'middle_name', 'date_of_birth',
            'time_of_beginning', 'department', 'direction_name',
            'type_patient', 'direction'
            ]

        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 90%", 'placeholder': "Ім'я пацієнта"}),
            'last_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 80%", 'placeholder': "Прізвище пацієнта"}),
            'middle_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width:80%", 'placeholder': "По-батькові пацієнта"}),
            'date_of_birth': forms.DateInput(attrs={'type': 'date', 'class': 'form_date', 'style': "width: 72%"}),
            'department': forms.Select(attrs={'id': 'department', 'style': 'width: 78%'}),
            'time_of_beginning': forms.DateTimeInput(attrs={'type': 'datetime-local', 'class': 'form_date', 'style': "width: 77%"}),
            'direction_name': forms.TextInput(attrs={'class': 'input_field', 'style': "width: 87%", 'placeholder': "Назва закладу"}),
            'type_patient': forms.Select(attrs={'class': 'select_element', 'style': 'width: 70%'}),
            'direction': forms.Select(attrs={'class': 'select_element', 'style': 'width: 80%'}),
        }


    @staticmethod
    def doc_list():
        doc_choises = [('', '')]
        for spec in Doctors.objects.values_list('specialization', flat=True).distinct().order_by('specialization'):
            sub_list = []
            for doc in Doctors.objects.all().order_by('last_name'):
                if spec == doc.specialization:
                    sub_list.append((doc.id, doc))
            doc_choises.append((spec, tuple(sub_list)))

        return doc_choises

    doctor = forms.ChoiceField(
        choices=doc_list(),
        widget=forms.Select(attrs={'id': 'doctor', 'style': 'width: 88%'}))

    @staticmethod
    def diagnosis_list():
        diagnosis_choises = [('', '')]
        for type in Diagnoses.objects.values_list('type_name', flat=True).distinct().order_by('type_name'):
            sub_list = []
            for diagnosis in Diagnoses.objects.all().order_by('name'):
                if type == diagnosis.type_name:
                    sub_list.append((diagnosis.id, diagnosis.name))
            diagnosis_choises.append((type, tuple(sub_list)))

        return diagnosis_choises

    diagnosis = forms.ChoiceField(
        choices=diagnosis_list(),
        widget=forms.Select(attrs={'id': 'diagnosis', 'style': 'width: 88%'}))
    

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['doctor'].choices = self.doc_list()
        self.fields['diagnosis'].choices = self.diagnosis_list()
        self.fields['time_of_beginning'].required = False
        self.fields['direction'].required = False
        self.fields['direction_name'].required = False
        self.fields['type_patient'].empty_label = 'Оберіть тип пацієнта'
        self.fields['direction'].empty_label = 'Оберіть направлення'


    def save(self, commit=True):
        data = super().save(commit=False)
        data.diagnosis_id = int(self.data['diagnosis'])
        data.doctor_id = int(self.data['doctor'])
        data.diagnosis_id = int(self.data['type_patient'])
        if data.type_patient.type_patient == 'Плановий':
            data.time_of_beginning = None
            data.direction_id = int(self.data['direction'])
        else:
            data.direction = None
            data.direction_name = None
        data.save()
        return data



class PatientReleaseForm(forms.ModelForm):

    class Meta:
        model = Patient
        fields = ['result', 'patient_paper']

        widgets = {
            'result': forms.Select(attrs={'class': 'select_element', 'style': 'width: 83%'}),
            'patient_paper': forms.Select(attrs={'class': 'select_element', 'style': 'width: 74%'})
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['result'].empty_label = 'Оберіть результат лікування'
        self.fields['patient_paper'].empty_label = 'Оберіть вид'