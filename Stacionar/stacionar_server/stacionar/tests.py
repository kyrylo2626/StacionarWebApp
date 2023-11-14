from django.test import TestCase
from django.contrib.auth.models import User
from django.test import Client
from .models import *

class TestStacionar(TestCase):

    def setUp(self):
        direction_obj = Direction.objects.create(direction='Лікарня')
        type_patient_obj = Type.objects.create(type_patient='Плановий')
        paper_obj = Paper.objects.create(patient_paper='Відкритий')
        status_obj = Status.objects.create(status='На лікуванні')
        Result.objects.create(result='Одужання')

        doctor_obj = Doctors.objects.create(first_name='FirstName', last_name='LastName',
                                middle_name='MiddleName', specialization='Spec')
        department_obj = Departments.objects.create(name='Department', number='1')
        diagnosis_obj = Diagnoses.objects.create(type_name='DiagnosisType', name='DiagnosisName')

        Patient.objects.create(first_name='PatinetFName', last_name='PatinetLName', middle_name='PatinetMName',
                                date_of_birth='2023-06-16', department=department_obj, direction_name='Ambulance',
                                type_patient=type_patient_obj, direction=direction_obj, status=status_obj,
                                doctor=doctor_obj, diagnosis=diagnosis_obj, patient_paper=paper_obj)


    def login(self):
        User.objects.create_user(username='testuser', password='12345')
        self.test_client = Client()
        self.test_client.login(username='testuser', password='12345')


    def test_login(self):
        self.assertEqual(self.client.get('/login/').status_code, 200)

        self.assertEqual(self.client.get('/poisk/').status_code, 302)
        self.assertEqual(self.client.get('/poisk/').url, '/login/?next=/poisk/')
        self.assertEqual(self.client.get('/dani/').status_code, 302)
        self.assertEqual(self.client.get('/dani/').url, '/login/?next=/dani/')
        self.assertEqual(self.client.get('/zvitnist/').status_code, 302)
        self.assertEqual(self.client.get('/zvitnist/').url, '/login/?next=/zvitnist/')
        self.assertEqual(self.client.get('/patient/1/').status_code, 302)
        self.assertEqual(self.client.get('/patient/1/').url, '/login/?login=/patient/1/')

        User.objects.create_user(username='testuser', password='12345')
        self.test_client = Client()
        self.assertEqual(self.test_client.login(username='testuser', password='00000'), False)
        self.assertEqual(self.test_client.login(username='testuser', password='12345'), True)

    
    def test_logout(self):
        self.login()
        self.assertEqual(self.test_client.get('').status_code, 200)
        self.test_client.logout()
        self.assertEqual(self.test_client.get('/poisk/').status_code, 302)
        self.assertEqual(self.test_client.get('/poisk/').url, '/login/?next=/poisk/')
        

    def test_views(self):
        self.login()

        self.assertEqual(self.test_client.get('').status_code, 200)

        self.assertEqual(self.test_client.get('/poisk/').status_code, 200)

        self.assertEqual(self.test_client.get('/dani/').status_code, 200)
        self.assertEqual(self.test_client.get('/dani/pacient/').status_code, 200)
        self.assertEqual(self.test_client.get('/dani/likar/').status_code, 200)
        self.assertEqual(self.test_client.get('/dani/viddilennya/').status_code, 200)
        self.assertEqual(self.test_client.get('/dani/diagnoz/').status_code, 200)

        self.assertEqual(self.test_client.get('/zvitnist/').status_code, 200)


    def test_input_data(self):
        self.login()

        input_test = self.test_client.post('/dani/likar/', {'first_name': 'FirstName1', 'last_name': 'LastName1',
                                                        'middle_name': 'MiddleName1', 'specialization': 'Spec1'})
        self.assertEqual(input_test.status_code, 302)
        input_test = self.test_client.post('/dani/viddilennya/', {'name': 'Department1', 'number': '11'})
        self.assertEqual(input_test.status_code, 302)
        input_test = self.test_client.post('/dani/diagnoz/', {'type_name': 'DiagnosisType1', 'name': 'DiagnosisName1'})
        self.assertEqual(input_test.status_code, 302)
        input_test = self.test_client.post('/dani/pacient/', {'first_name': 'PatinetFName1', 'last_name': 'PatinetLName1',
                                                        'middle_name': 'PatinetMName1', 'date_of_birth': '2023-06-11',
                                                        'department': 2, 'direction_name': 'Ambulance',
                                                        'type_patient': 1, 'direction': 1,
                                                        'doctor': 2, 'diagnosis': 2})
        self.assertEqual(input_test.status_code, 200)


    def test_show_data(self):
        self.login()
        pk = Patient.objects.all()[0].pk
        data = self.test_client.get(f'/patient/{pk}/', follow=True).content.decode()
        test_data = ['PatinetLName PatinetFName PatinetMName', '16.06.2023', 'Плановий',
                    'На лікуванні', 'DiagnosisName', 'Department №1',
                    'LastName FirstName MiddleName', 'Лікарня', 'Ambulance']
        for element in test_data:
            self.assertIn(element, data)


    def test_change_data(self):
        self.login()
        pk = Patient.objects.all()[0].pk
        self.test_client.post(f'/patient/updatedata/{pk}/', {'first_name': ['Josef'], 'last_name': ['Valentine'],
                                                        'middle_name': ['James'], 'date_of_birth': '2023-06-16',
                                                        'department': 1, 'direction_name': 'Ambulance',
                                                        'type_patient': 1, 'direction': 1,
                                                        'doctor': 1, 'diagnosis': 1})

        data = self.test_client.get(f'/patient/{pk}/', follow=True).content.decode()
        self.assertIn('Valentine Josef James', data)


    def test_zvitnist(self):
        self.login()
        search_data = {'diagnosis_type': ['DiagnosisType']}

        data = self.test_client.post('/zvitnist/', search_data, follow=True).content.decode()
        self.assertIn('<b>1</b>', data)

    
    def test_release_data(self):
        self.login()
        pk = Patient.objects.all()[0].pk
        rk = Result.objects.all()[0].pk
        ppk = Paper.objects.all()[0].pk
        Status.objects.create(status='Виписано')
        self.test_client.post(f'/patient/releasedata/{pk}/', {'result': [rk], 'patient_paper': [ppk]})

        data = self.test_client.get(f'/patient/{pk}/', follow=True).content.decode()
        self.assertIn('Одужання', data)
        self.assertIn('Відкритий', data)


    def test_search_data(self):
        self.login()
        search_data = {
            'patinet_name': [''], 'patient_type': [''], 'doctor': [''],
            'doctor_spec': [''], 'diagnosis_type': [''], 'diagnosis': [''],
            'patient_status': [''], 'department': ['']
            }

        data = self.test_client.post('/poisk/', search_data, follow=True).content.decode()

        test_data = [
            'PatinetLName PatinetFName PatinetMName', 'На лікуванні',
            'DiagnosisName', 'LastName F.M.', 'Department №1'
        ]

        for element in test_data:
            self.assertIn(element, data)
