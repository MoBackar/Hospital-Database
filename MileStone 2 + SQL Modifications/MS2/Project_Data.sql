/*

-- inserting 4 Users into Patients
Insert into Patient values(1,'Ahmed',17,'Vegetarian','5/10','Hatim',201134,'ahmed123')
Insert into Patient values(2,'Mohamed',20,'No-Diet','7/10','Marwa',201127,'mohamed123')
Insert into Patient values(3,'Mazen',20,'Fish','9/10','Ahmed',201005,'mazen123')
Insert into Patient values(4,'Mostafa',20,'Keto','8/10','Ashraf',4916647,'mostafa123')

-- Inserting 4 users into nurse
insert into Nurse values(1,'TA','Toka','Osama','toka123')
insert into Nurse Values(2,'Mohamed','Ehab','Ihab','ehab123')
insert into Nurse Values(3,'Kareem','Abdel','Wahab','kareem123')
insert into Nurse Values(4,'Micheal','Jordan','Nabaweya','jordan123')

-- Inserting 5 Hospital Entities
insert into Hospital Values('Misr-Int-Hospital','MIH@gmail.com')
insert into Hospital Values('As-Salam','A-SIH@gmail.com')
insert into Hospital Values('Nile-Hospital','NH@gmail.com')
insert into Hospital Values('Daar-el-Foad','DAF@gmail.com')
insert into Hospital Values('Al-Qasr-El-Aeny','AQEA@gmail.com')

-- Inserting 4 users into Doctor
insert into Doctor Values(1,'Yousef','Dentist','Misr-Int-Hospital','yoyo123')
insert into Doctor Values(2,'Hamada','Surgeon','As-Salam','h123')
insert into Doctor Values(3,'Riad','Cardiologist','As-Salam','r123')
insert into Doctor Values(4,'Fasal','Neurologist','Daar-el-Foad','f123')

-- Inserting 4 Users into Pharmacist
insert into Pharmacist Values(1,'11/20/2000','David','El_Azaby','david123')
insert into Pharmacist Values(2,'1/19/2001','Omar','El_Asyotya','omar123')
insert into Pharmacist Values(3,'11/20/1999','Saed','El_Ayooty','saed123')
insert into Pharmacist Values(4,'11/20/1988','Turker','El_Alamny','turker123')

--Inserting 10 prescriptions 
Insert into prescription Values('11/1/2023',1)
insert into presc_for Values('11/1/2023',1,1)

Insert into prescription Values('10/3/2023',2)
insert into presc_for Values('10/3/2023',2,2)

Insert into prescription Values('7/1/2023',3)
insert into presc_for Values('7/1/2023',3,3)

Insert into prescription Values('1/12/2023',4)
insert into presc_for Values('1/12/2023',4,4)

Insert into prescription Values('8/8/2023',1)
insert into presc_for Values('8/8/2023',1,2)

Insert into prescription Values('11/9/2023',1)
insert into presc_for Values('11/9/2023',1,3)

Insert into prescription Values('11/1/2019',1)
insert into presc_for Values('11/1/2019',1,4)


Insert into prescription Values('5/5/2021',2)
insert into presc_for Values('5/5/2021',2,3)

Insert into prescription Values('3/3/2021',4)
insert into presc_for Values('3/3/2021',4,1)

Insert into prescription Values('11/1/2020',1)
insert into presc_for Values('11/1/2020',1,1)

--Inserting Emergency_medical_services
insert into Emergency_medical_services Values(1,'al hamd Service')
insert into Emergency_medical_services Values(2,'al-Foad Service')
insert into Emergency_medical_services Values(3,'Misr Services')
insert into Emergency_medical_services Values(4,'al Reda Service')
insert into Emergency_medical_services Values(5,'al mostawa Service')

--inserting Insurance Companies
insert into Insurance_company values('Humana')
insert into Insurance_company values('UnitedHealthCare')
insert into Insurance_company values('MetLife')
insert into Insurance_company values('Aetna')
insert into Insurance_company values('Oscar Health')

-Inserting 10 treatments 
insert into Treatment values(1,200)
insert into Medication values(1,'alphaterin')
insert into Treatment values(2,150)
insert into Medication values(2,'Dopamine')
insert into Treatment values(3,900)
insert into Medication values(3,'Chemo')
insert into Treatment values(4,100)
insert into Medication values(4,'Poly_fresh')
insert into Treatment values(5,5)
insert into Medication values(5,'pandol')
insert into Treatment values(6,200)
insert into Surgery values(6,'tooth decay')
insert into Treatment values(7,6000)
insert into Surgery values(7,'eye-removal')
insert into Treatment values(8,30000)
insert into Surgery values(8,'open heart')
insert into Treatment values(9,800)
insert into Surgery values(9,'amputation')
insert into Treatment values(10,10000)
insert into Surgery values(10,'Bone Fracture')

--Inserting 5 labtests
insert into Lab_tests values(1,4)
insert into lab_for values(1,4,1)
insert into Lab_tests values(2,2)
insert into lab_for values(2,2,1)
insert into Lab_tests values(3,3)
insert into lab_for values(3,3,3)
insert into Lab_tests values(4,2)
insert into lab_for values(4,2,4)
insert into Lab_tests values(5,1)
insert into lab_for values(5,1,2)
*/