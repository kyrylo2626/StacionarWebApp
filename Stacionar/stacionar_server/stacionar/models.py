from django.db import models
from django.urls import reverse



class Patient(models.Model):

    first_name = models.CharField(max_length=50, verbose_name="Ім'я")
    last_name = models.CharField(max_length=50, verbose_name='Прізвище')
    middle_name = models.CharField(max_length=50, null=True, verbose_name='По-батькові')
    date_of_birth = models.DateField(verbose_name='Дата народження')

    status = models.ForeignKey('Status', on_delete=models.PROTECT, default=1, verbose_name='Статус')
    type_patient = models.ForeignKey('Type', on_delete=models.PROTECT, verbose_name='Тип')

    time_of_beginning = models.DateTimeField(null=True, verbose_name='Початок хвороби')
    time_of_ending = models.DateTimeField(null=True, verbose_name='Виписано')
    direction = models.ForeignKey('Direction', on_delete=models.PROTECT, null=True, verbose_name='Направлення')
    direction_name = models.CharField(max_length=200, null=True, verbose_name='Назва закладу направлення')

    diagnosis = models.ForeignKey('Diagnoses', on_delete=models.PROTECT, verbose_name='Діагноз')
    department = models.ForeignKey('Departments', on_delete=models.PROTECT, verbose_name='Відділення')
    doctor = models.ForeignKey('Doctors', on_delete=models.PROTECT, verbose_name='Лікар')

    result = models.ForeignKey('Result', on_delete=models.PROTECT, null=True, verbose_name='Результат')
    patient_paper = models.ForeignKey('Paper', on_delete=models.PROTECT, default=1, verbose_name='Лист пацієнта')

    time_create = models.DateTimeField(auto_now_add=True, verbose_name='Зараховано')
    time_update = models.DateTimeField(auto_now=True, verbose_name='Дані оновлено')

    def __str__(self):
        return f'{self.last_name} {self.first_name} {self.middle_name}'

    def get_absolute_url(self):
        return reverse('patient_data', kwargs={'pk': self.pk})

    class Meta:
        verbose_name = 'Пацієнти'
        verbose_name_plural = 'Пацієнти'
        ordering = ['last_name', 'first_name', 'middle_name', 'time_create']



class Diagnoses(models.Model):

    type_name = models.CharField(max_length=255, verbose_name='Клас діагнозу')
    name = models.CharField(max_length=255, verbose_name='Діагноз')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Діагнози'
        verbose_name_plural = 'Діагнози'
        ordering = ['type_name', 'name']



class Doctors(models.Model):

    first_name = models.CharField(max_length=50, verbose_name="Ім'я")
    last_name = models.CharField(max_length=50, verbose_name='Прізвище')
    middle_name = models.CharField(max_length=50, null=True, verbose_name='По-батькові')

    specialization = models.CharField(max_length=255, verbose_name='Спеціалізація')

    def __str__(self):
        return f'{self.last_name} {self.first_name} {self.middle_name}'

    class Meta:
        verbose_name = 'Лікарі'
        verbose_name_plural = 'Лікарі'
        ordering = ['last_name', 'first_name', 'middle_name', 'specialization']


class Departments(models.Model):

    name = models.CharField(max_length=50, verbose_name='Назва відділення')
    number = models.IntegerField(verbose_name='Номер відділення')

    def __str__(self):
        return f'{self.name} №{self.number}'

    class Meta:
        verbose_name = 'Відділення'
        verbose_name_plural = 'Відділення'
        ordering = ['name', 'number']



class Status(models.Model):

    status = models.CharField(max_length=50, verbose_name='Статус пацієнта')

    def __str__(self):
        return self.status

    class Meta:
        verbose_name = 'Статус пацієнта'
        verbose_name_plural = 'Статус пацієнта'
        ordering = ['status']

class Type(models.Model):

    type_patient = models.CharField(max_length=50, verbose_name='Тип пацієнта')

    def __str__(self):
        return self.type_patient

    class Meta:
        verbose_name = 'Тип пацієнта'
        verbose_name_plural = 'Тип пацієнта'
        ordering = ['type_patient']

class Direction(models.Model):

    direction = models.CharField(max_length=50, verbose_name='Направлення')

    def __str__(self):
        return self.direction

    class Meta:
        verbose_name = 'Направлення'
        verbose_name_plural = 'Направлення'
        ordering = ['direction']

class Result(models.Model):

    result = models.CharField(max_length=50, verbose_name='Результат лікування')

    def __str__(self):
        return self.result

    class Meta:
        verbose_name = 'Результат лікування'
        verbose_name_plural = 'Результат лікування'
        ordering = ['result']

class Paper(models.Model):

    patient_paper = models.CharField(max_length=50, verbose_name='Лист пацієнта')

    def __str__(self):
        return self.patient_paper

    class Meta:
        verbose_name = 'Лист пацієнта'
        verbose_name_plural = 'Лист пацієнта'
        ordering = ['patient_paper']