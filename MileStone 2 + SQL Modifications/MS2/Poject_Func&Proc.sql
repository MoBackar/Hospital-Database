/*
-- 4.1 (a) PatientRegister
CREATE PROCEDURE PatientRegister(@id INT, @p_name VARCHAR(20), @age INT, @diet VARCHAR(20), @exercise VARCHAR(20), @emergency_name VARCHAR(20), @emergency_number INT, @password VARCHAR(20))
AS INSERT INTO Patient VALUES(@id, @p_name, @age, @diet, @exercise, @emergency_name, @emergency_number, @password)

--4.1 (b) DoctorRegister
CREATE PROCEDURE DoctorRegister(@id INT, @d_name VARCHAR(20), @specialization VARCHAR(20), @h_name VARCHAR(20), @password VARCHAR(20))
AS INSERT INTO Doctor VALUES(@id, @d_name, @specialization, @h_name, @password)

--4.1 (c) PharmacistRegister
CREATE PROCEDURE PharmacistRegister(@id INT,@started_at DATE, @p_name VARCHAR(20), @ph_name VARCHAR(20), @password VARCHAR(20))
AS INSERT INTO Pharmacist VALUES(@id, @started_at, @p_name, @ph_name, @password)

--4.1 (D) NurseRegister
CREATE PROCEDURE NurseRegister(@id INT, @f_name VARCHAR(20),@m_name VARCHAR(20), @l_name VARCHAR(20), @password VARCHAR(20))
AS INSERT INTO Nurse VALUES(@id, @f_name,@m_name, @l_name, @password)

---------------------------------------------------------------------------------------------------------------------------------------------------------

--4.2 (a) userLogin
CREATE PROCEDURE userLogin(@id INT, @password VARCHAR(20)) 
AS
BEGIN
	IF EXISTS (SELECT * FROM Doctor WHERE @password = d_password AND @id = id)
		RETURN 1
	ELSE IF EXISTS (SELECT * FROM Patient WHERE @password = p_password AND @id = id)
		RETURN 1
	ELSE IF EXISTS (SELECT * FROM Pharmacist WHERE @password = p_password AND @id = id)
		RETURN 1
	ELSE IF EXISTS (SELECT * FROM Nurse WHERE @password = n_password AND @id = id)
		RETURN 1
	ELSE
		RETURN 0
END

--4.2 (b) addMobile
CREATE PROCEDURE addMobile(@id INT, @mobile INT)
AS
BEGIN
INSERT INTO Doc_Phone_numbers VALUES(@id, @mobile)
END

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--4.3 (a) PatientList
CREATE PROCEDURE PatientList
AS
BEGIN
SELECT * FROM Patient
END

--4.3 (b) DoctorsList
CREATE PROCEDURE DoctorList
AS
BEGIN
SELECT * FROM Doctor
END

--4.3 (c) PharmacistList
CREATE PROCEDURE PharmacistList
AS
BEGIN
SELECT * FROM Pharmacist
END

--4.3 (d) AdminViewPatientProfile
CREATE PROCEDURE AdminViewPatientProfile(@patientId INT)
AS BEGIN
SELECT * FROM Patient WHERE id = @patientId
END

--4.3 (e) AdminAddPatientInfo
CREATE PROCEDURE AdminAddPatientInfo(@id INT, @p_name VARCHAR(20), @age INT, @diet VARCHAR(20), @exercise VARCHAR(20), @emergency_name VARCHAR(20), @emergency_num VARCHAR(20), @p_password VARCHAR(20))
AS BEGIN
if NOT EXISTS (SELECT * From Patient where id=@id)
BEGIN
INSERT INTO PATIENT VALUES(@id, @p_name, @age, @diet, @exercise, @emergency_name, @emergency_num, @p_password)
return 1
END
else
return 0
END

-4.3 (f) AdminUpdatePatientInfo
CREATE PROCEDURE AdminUpdatePatientInfo(@id INT, @p_name VARCHAR(20), @age INT, @diet VARCHAR(20), @exercise VARCHAR(20), @emergency_name VARCHAR(20), @emergency_num VARCHAR(20), @p_password VARCHAR(20))
AS BEGIN
if EXISTS(SELECT * from Patient where id=@id) 
Begin
UPDATE Patient 
SET p_name = @p_name, age = @age, diet = @diet, exercise = @exercise, emergency_name = @emergency_name, emergency_num = @emergency_num, p_password = @p_password
WHERE @id = Patient.id
return 1
end
else 
return 0
END

--4.3 (g) AdminViewPatientAndHospitalPerDoc
CREATE PROCEDURE AdminViewPatientAndHospitalPerDoc 
AS 
BEGIN
SELECT d_name AS DOCTOR_NAME, p_name AS PATIENT_NAME, P.age AS PATIENT_AGE, D.hospital_name AS HOSPITAL_NAME FROM Doctor D INNER JOIN Make_appointment M ON M.doc_id = D.id INNER JOIN Patient P ON P.id = M.pat_id
END

--4.3 (h) AdminViewAllPatientsAndMeds
CREATE PROCEDURE AdminViewAllPatientsAndMeds
AS BEGIN
SELECT P.p_name, M.m_name  FROM Patient P INNER JOIN Takes T ON T.pat_id = P.id INNER JOIN Medication M ON M.treatment_id = T.treatment_id
END

--4.3 (i)  AdminViewPatientsAndMeds
CREATE PROCEDURE AdminViewPatientsAndMeds(@pat_id INT)
AS BEGIN
SELECT P.p_name, M.m_name  FROM Patient P INNER JOIN Takes T ON T.pat_id = P.id INNER JOIN Medication M ON M.treatment_id = T.treatment_id
WHERE P.id = @pat_id
END

--4.3 (j) AdminViewTreatmentPerDocAndPatient
CREATE PROCEDURE AdminViewTreatmentPerDocAndPatient 
AS BEGIN
SELECT * from Decide_on
end

--4.3 (k) AdminViewLabPerDocAndPatient
CREATE PROCEDURE AdminViewLabPerDocAndPatient
AS BEGIN 
SELECT * FROM lab_for
END

--4.3 (l) AdminViewPresPerDocAndPatient
CREATE PROCEDURE AdminViewPresPerDocAndPatient
AS BEGIN 
SELECT * FROM presc_for
END

--4.3 (m) AdminViewPharmacists
CREATE PROCEDURE AdminViewPharmacists
AS BEGIN
SELECT p_name, pharmacy_name, p_date FROM Pharmacist P INNER JOIN Prec_Check C ON C.pharma_id = P.id
END

--4.3 (n) AdminViewPharmacistProfile
CREATE PROCEDURE AdminViewPharmacistProfile @id INT
AS BEGIN
SELECT * FROM Pharmacist WHERE id = @id
END

--4.3 (o) AdminViewNurse
CREATE PROCEDURE AdminViewNurse
AS BEGIN
SELECT  N.id, N.first_name, N.middle_name, N.last_name, N.n_password, P.id AS PATIENT_id, P.p_name AS PATIENT_NAME FROM Nurse N INNER JOIN Observe_monitor O ON O.nur_id = N.id INNER JOIN Patient P ON O.pat_id = P.id
END

--4.3 (p) AdminViewHospital
CREATE PROCEDURE AdminViewHospital 
AS BEGIN
SELECT H.h_name, H.email, P.id AS PATIENT_id, P.p_name AS PATIENT_name FROM Hospital H INNER JOIN Provide_facilities F ON H.h_name = F.h_name INNER JOIN Patient P ON F.pat_id = P.id
END

--4.3 (q) AdminViewAmb
CREATE PROCEDURE AdminViewAmb 
AS BEGIN
SELECT EMS.service_id, EMS.EM_name, H.h_name FROM Hospital H INNER JOIN Provide_ambulance_service Pro ON Pro.hospital_name = H.h_name INNER JOIN Emergency_medical_services EMS ON EMS.service_id = Pro.EM_id
END

--4.3 (r) AdminViewCall
CREATE PROCEDURE AdminViewCall
AS BEGIN
SELECT * FROM Emergency_medical_services EMS INNER JOIN Emergency_call_center ECC ON EMS.service_id = ECC.service_id
END

--4.3 (s) AdminViewCon
CREATE PROCEDURE AdminViewCon
AS BEGIN
SELECT * FROM Hospital H INNER JOIN Sign_contract SC ON SC.h_name = H.h_name INNER JOIN Insurance_company I ON I.i_name = SC.i_name
END

--4.3 (t) AdminViewCover
CREATE PROCEDURE AdminViewCover (@id INT)
AS BEGIN 
IF EXISTS (SELECT * FROM Treatment where id=@id and insured= '1')
	return 1
else 
	return 0
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4.4 (a) PatCheckHos
Create PROCEDURE PatCheckHos 
AS BEGIN
SELECT H.h_name,D.d_name FROM Hospital H LEFT OUTER JOIN Doctor D ON H.h_name = D.hospital_name
end

--4.4 (b) PatCheckPerHos
CREATE PROCEDURE PatCheckPerHos(@name VARCHAR(20))
AS BEGIN
SELECT H.h_name,D.d_name FROM Hospital H LEFT OUTER JOIN Doctor D ON H.h_name = D.hospital_name where H.h_name=@name
end

--4.4 (c) MakeAppointment
Create PROCEDURE MakeAppointment(@DoctorID int ,@PatientID int)
	AS BEGIN	
	if NOT Exists((SELECT id from Doctor where @DoctorID=id)) OR NOT Exists((SELECT id from Patient where @PatientID=id)) 
		begin
		return 0
		end
	else
	begin
		insert into Make_appointment Values(@PatientID,@DoctorID) 
		return 1
	end
end

--4.4 (d) viewMyProfile
Create PROCEDURE viewMyProfile(@id int)
AS BEGIN
	Select * from Patient Where Patient.id= @id
end

--4.4 (e) editMyProfile
Create Procedure EditMyProfile(@ID INT,@p_name VARCHAR(20),@age int,@diet VARCHAR(20),@excercise VARCHAR(20),@E_M VARCHAR(20), @E_P VARCHAR(20),@password VARCHAR(20)) 
	AS
	BEGIN
	UPDATE Patient
	SET p_name=@p_name ,age=@age,diet=@diet, exercise=@excercise,emergency_name=@E_M,emergency_num=@E_P, p_password=@password Where id=@ID
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4.5 (a) DocViewHis
Create Procedure DocViewHis(@patientId int) 
AS
Begin
Select * from EHR Where EHR.patient_id= @patientId
END

--4.5 (b) DoctorReqLab
Create PROCEDURE DoctorReqLab(@DoctorID int ,@PatientID int,@labID int)  AS BEGIN	
	if NOT Exists((SELECT id from Doctor where @DoctorID=id)) OR NOT Exists((SELECT id from Patient where @PatientID=id)) Or Exists ((SELECT * from Lab_tests where test_id=@labID and @DoctorID=doc_id)) 
		begin
		return 0
		end
	else
		insert into Lab_tests values(@labID,@DoctorID)
		insert into lab_for  values(@labID,@DoctorID,@PatientID)
		return 1
end 

--4.5 (c) DocWritePres
Create PROCEDURE DocWritePres(@DoctorID int ,@PatientID int,@date Date)  AS BEGIN	
	if NOT Exists((SELECT id from Doctor where @DoctorID=id)) OR NOT Exists((SELECT id from Patient where @PatientID=id)) OR EXISTS (SELECT * FROM prescription where @DoctorID=doc_id and @date=p_date)
		begin
		return 0
		end
	else
		insert into prescription values(@date,@DoctorID)
		insert into presc_for  values(@date,@DoctorID,@PatientID)
		return 1
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

--4.6 (a) CheckPres
Create procedure CheckPres(@PharmacistID INT, @DoctorID INT, @PatientID INT,@Date Date)
	AS
	Begin(
		SELECT P.p_date AS 'prescription date',P.doc_id AS 'Doctors ID',patient_id AS 'Patient ID',pharma_id As 'Pharmacist ID'
			from prescription P INNER JOIN Prec_Check PC on P.p_date=PC.p_date and P.doc_id=PC.doc_id
			INNER JOIN presc_for PF on P.p_date=PF.p_date and P.doc_id=PF.doc_id
			WHERE P.p_date=@Date and P.doc_id=@DoctorID and PF.patient_id=@PatientID and PC.pharma_id=@PharmacistID
	)
	end

--4.6 (b,a) PharViewProfile
CREATE PROCEDURE PharViewProfile(@ID INT)
AS BEGIN 
Select * from Pharmacist where Pharmacist.id=@ID
end

--4.6 (b,b) UpdatePharProfile
Create Procedure UpdatePharProfile(@ID INT,@Started DATE,@name VARCHAR(20),@Phar_name VARCHAR(20),@password VARCHAR(20)) 
	AS
	BEGIN
	UPDATE Pharmacist
	SET started_at=@Started ,pharmacy_name=@Phar_name,p_name=@name,p_password=@password Where id=@ID
	END
*/