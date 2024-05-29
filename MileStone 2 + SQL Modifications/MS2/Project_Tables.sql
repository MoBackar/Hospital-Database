/*

CREATE TABLE Hospital(
	h_name VARCHAR(20) PRIMARY KEY,
	email VARCHAR(30)
	)

CREATE TABLE Branch_locations(
	h_name VARCHAR(20) references Hospital,
	b_location VARCHAR(20) ,PRIMARY KEY (h_name,b_location)
	)

CREATE TABLE Pharmacist(
	id INT PRIMARY KEY NOT NULL,
	started_at date,
	p_name VARCHAR(20),
	pharmacy_name VARCHAR(20),
	year_of_exp as (year(CURRENT_TIMESTAMP) - year(started_at)) 
	)

CREATE TABLE Patient(
	id INT PRIMARY KEY,
	p_name VARCHAR(20),
	age INT,
	diet VARCHAR(20),
	exercise VARCHAR(20),
	emergency_name VARCHAR(20),
	emergency_num INT
	)

CREATE TABLE EHR(
	patient_id INT references Patient,
	EHR_number INT,
	chronic_disease VARCHAR(20),
	allergy VARCHAR(20),
	vaccine VARCHAR(20),
	prescribed_drugs VARCHAR(20),
	test_result VARCHAR(20),
	examination_result VARCHAR(20), PRIMARY KEY(patient_id, EHR_number)
	)

CREATE TABLE Doctor(
	id INT PRIMARY KEY,
	d_name VARCHAR(20),
	specialization VARCHAR(20),
	hospital_name VARCHAR(20) references Hospital
	)

CREATE TABLE Doc_Phone_numbers(
	doc_id INT references Doctor,
	phone_num INT, PRIMARY KEY(doc_id, phone_num)
	)

CREATE TABLE Working_schedule(
		doc_id INT references Doctor,
		w_days VARCHAR(10),
		w_hours VARCHAR(10), PRIMARY KEY(doc_id,w_days,w_hours)
		)

CREATE TABLE prescription(
	p_date DATE ,
	doc_id INT references Doctor, PRIMARY KEY(p_date,doc_id)
	)

CREATE TABLE Lab_tests(
	test_id INT,
	doc_id INT references Doctor, PRIMARY KEY(doc_id,test_id)
		)

CREATE TABLE Emergency_medical_services(
	service_id INT PRIMARY KEY,
	EM_name VARCHAR(20)
	)

CREATE TABLE Emergency_call_center(
	id INT PRIMARY KEY,
	service_id INT references Emergency_medical_services
	)

CREATE TABLE Nurse(
	id INT PRIMARY KEY,
	first_name VARCHAR(20),
	middle_name VARCHAR(20),
	last_name VARCHAR(20)
	)

CREATE TABLE nurse_shift(
	n_shift VARCHAR(20),
	nurse_id INT references Nurse, PRIMARY KEY(n_shift, nurse_id)
	)

CREATE TABLE Insurance_company(
	i_name VARCHAR(20) PRIMARY KEY
	)

-- Function needed for Treatment table
	CREATE Function DET_Price(@price DECIMAL) 
	returns bit 
	AS
	BEGIN
		DECLARE @Y bit
		if @price>200
			SET @Y= 0
		else
			SET @Y= 1
		RETURN @Y
	END
	
CREATE TABLE Treatment(
	id INT PRIMARY KEY,
	price INT,
	Not-insured AS dbo.DET_Price(price)
	)

CREATE TABLE Medication(
	treatment_id INT PRIMARY KEY references Treatment,
	m_name VARCHAR(20)
	)

CREATE TABLE Surgery(
	treatment_id INT PRIMARY KEY references Treatment,
	s_type VARCHAR(20)
	)

CREATE TABLE Listen_examine(
	pat_id INT references Patient,
	doc_id INT references Doctor, PRIMARY KEY(pat_id, doc_id)
	)

CREATE TABLE Make_appointment(
	pat_id INT references Patient,
	doc_id INT references Doctor, PRIMARY KEY(pat_id, doc_id)
	)

CREATE TABLE Checking(
	hospital_name VARCHAR(20) references Hospital,
	pat_id INT references Patient,
	doc_id INT references Doctor, PRIMARY KEY(pat_id, doc_id, hospital_name)
	)

CREATE TABLE Decide_on(
	patient_id INT references Patient,
	treatment_id INT references Treatment,
	doc_id INT references Doctor, PRIMARY KEY (patient_id, treatment_id)
	)

CREATE TABLE Provide_ambulance_service(
	hospital_name VARCHAR(20) references Hospital,
	EM_id INT references Emergency_medical_services, PRIMARY KEY(hospital_name, EM_id)
	)

CREATE TABLE Pre_hospital_treatment(
	hospital_name VARCHAR(20) references Hospital,
	EM_id INT references Emergency_medical_services, PRIMARY KEY(hospital_name, EM_id)
	)

CREATE TABLE Prepares_gives(
	pat_id INT references Patient,
	doc_id INT references Doctor,
	pharmacist_id INT references Pharmacist,
	treatment_id INT PRIMARY KEY references Medication
	)

CREATE TABLE Provide_facilities(
	h_name VARCHAR(20) references Hospital,
	pat_id INT references Patient, PRIMARY KEY (h_name, pat_id)
	)

CREATE TABLE Provide_emergency_care(
	h_name VARCHAR(20) references Hospital,
	pat_id INT references Patient, PRIMARY KEY (h_name, pat_id)
	)

CREATE TABLE Insures(
	pat_id INT PRIMARY KEY references Patient,
	i_name VARCHAR(20) references Insurance_company
	)

CREATE TABLE Process_claim(
	pat_id INT PRIMARY KEY references Patient,
	i_name VARCHAR(20) references Insurance_company
	)
CREATE TABLE Pay_covered_expenses(
	pat_id INT PRIMARY KEY references Patient,
	i_name VARCHAR(20) references Insurance_company
	)

CREATE TABLE Provide_medical_care_guidance(
	pat_id INT PRIMARY KEY references Patient,
	i_name VARCHAR(20) references Insurance_company
	)

CREATE TABLE Takes(
	treatment_id INT references Medication,
	pat_id INT references Patient, PRIMARY KEY(pat_id, treatment_id)
	)

CREATE TABLE Observe_monitor(
	pat_id INT references Patient,
	nur_id INT references Nurse,
	treatment_id INT references Treatment, PRIMARY KEY(pat_id, nur_id, treatment_id)
	)

CREATE TABLE Sign_contract(
	h_name VARCHAR(20) references Hospital,
	i_name VARCHAR(20) references Insurance_company,
	PRIMARY KEY (h_name, i_name)
	)
CREATE TABLE Administer(
	pat_id INT references Patient,
	nur_id INT references Nurse,
	treatment_id INT references Treatment, PRIMARY KEY(pat_id, nur_id, treatment_id)
	)

CREATE TABLE Check_vitals(
	nurse_id INT references Nurse,
	pat_id INT references Patient, PRIMARY KEY(pat_id, nurse_id)
	)

CREATE TABLE Admit_discharge(
	pat_id INT PRIMARY KEY references Patient,
	h_name VARCHAR(20) references Hospital
	)

CREATE TABLE Prec_Check (
    doc_id INT,
    p_date DATE,
    pharma_id INT,
    PRIMARY KEY (p_date,doc_id),
    FOREIGN KEY (p_date,doc_id) REFERENCES prescription,
    FOREIGN KEY (pharma_id) REFERENCES pharmacist(id)
)

CREATE TABLE lab_for(
	test_id INT,
	doc_id INT,
	patient_id INT,
	PRIMARY KEY (doc_id,test_id),
	FOREIGN KEY (doc_id,test_id) REFERENCES Lab_tests,
    FOREIGN KEY (patient_id) REFERENCES Patient
	)

CREATE TABLE presc_for(
	p_date Date,
	doc_id INT,
	patient_id INT,
	PRIMARY KEY (p_date,doc_id),
	FOREIGN KEY (p_date,doc_id) REFERENCES prescription,
    FOREIGN KEY (patient_id) REFERENCES Patient
	)

ALTER TABLE Patient
	ADD p_password VARCHAR(20)


ALTER TABLE Doctor
	ADD d_password VARCHAR(20)

ALTER TABLE Pharmacist
	ADD p_password VARCHAR(20)

ALTER TABLE Nurse	
	ADD n_password VARCHAR(20)
	*/