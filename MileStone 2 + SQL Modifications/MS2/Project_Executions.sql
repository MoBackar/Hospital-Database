/*
-- Exectuting 4.1 (a) 
EXEC PatientRegister 6,'ramy',12,'No-diet','8/10','Mona',112331,'ramy123'

-- Executing 4.1 (b)
EXEC DoctorRegister 15, 'backar', 'surgeon' , 'Daar-el-Foad', 'backar123'

-- Executing 4.1 (c) //
EXEC PharmacistRegister 18,'1/1/1989','roza','sead&philips','roza5'

-- Executing 4.1 (d)
EXEC NurseRegister 8 ,'mona','mona','lisa','mona23'

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Executing 4.2 (a)
Declare @X bit
EXEC @X= userLogin 1,'yoyo123'
print @X
Declare @Y bit
EXEC @Y= userLogin 2,'hamada'
print @Y

-- Executing 4.2 (b)
EXEC addMobile 1,'01123340124'

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Executing 4.3 (a)
EXEC PatientList

-- Executing 4.3 (b)
EXEC DoctorList

-- Executing 4.3 (c)
EXEC PharmacistList

--Executing 4.3 (d)
EXEC AdminViewPatientProfile 1

--Executing 4.3 (e)
Declare @X bit
exec @X= AdminAddPatientInfo 11 ,'mido',71,'No-diet','1/10','bibo','145829','mmido1234'
print @X

--Executing 4.3 (f)
Declare @X bit
exec @X= AdminUpdatePatientInfo 11 ,'mido',71,'No-diet','1/10','bibo','145829','mmido1234'
print @X

--Executing 4.3 (g)
EXEC AdminViewPatientAndHospitalPerDoc

--Executing 4.3 (h)
EXEC AdminViewAllPatientsAndMeds

--Executing 4.3 (i)
EXEC AdminViewPatientsAndMeds 1

--Executing 4.3 (j)
EXEC AdminViewTreatmentPerDocAndPatient

--Executing 4.3 (k)
EXEC AdminViewLabPerDocAndPatient

--Executing 4.3 (l)
EXEC AdminViewPresPerDocAndPatient

--Executing 4.3 (m)
EXEC AdminViewPharmacists

--executing 4.3 (n)
EXEC AdminViewPharmacistProfile 1

--executing 4.3 (o)
EXEC AdminViewNurse

--executing 4.3 (p)
EXEC AdminViewHospital

--executing 4.3 (q)
EXEC AdminViewAmb

--executing 4.3 (r)
EXEC AdminViewCall

--executing 4.3 (s)
EXEC AdminViewCon

--executing 4.3 (t)
DECLARE @X BIT
EXEC @X =AdminViewCover 1
Print @X

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--executing 4.4 (a)
EXEC PatCheckHos

--executing 4.4 (b)
EXEC PatCheckPerHos 'Al-Qasr-El-Aeny'

--executing 4.4 (c)
DECLARE @X bit 
exec @X=MakeAppointment 1 , 1
print @X

DECLARE @Y bit 
exec @Y= MakeAppointment 0,0
print @Y

--executing 4.4 (d)
EXEC viewMyProfile 1

--executing 4.4 (e)
EXEC EditMyProfile 1,'Ahmed',18,'Vegaterian','5/10','Hatim',2011200,'ahmed123'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--executing 4.5 (a)
EXEC DocViewHis 1

--executing 4.5 (b)
DECLARE @X bit 
EXEC @X =DoctorReqLab 1,11,1
print @X

--executing 4.5 (c)
DECLARE @X bit 
EXEC @X =DocWritePres 1,11,'1/1/2016'
print @X

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--executing 4.6 (a)
EXEC CheckPres 1,1,1,'1/1/2000'


--executing 4.6 (b,a)
PharViewProfile 1

--executing 4.6 (b,b)
EXEC PharViewProfile 1
EXEC UpdatePharProfile 1,'2000-11-20','DAVID','al mansoura','david 22' ;
EXEC PharViewProfile 1
*/

EXEC AdminViewLabPerDocAndPatient

