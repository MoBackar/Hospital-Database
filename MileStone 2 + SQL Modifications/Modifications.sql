/*CREATE PROCEDURE DocViewID(@doctorID INT)
AS
BEGIN
    SELECT *
    FROM Doctor
    WHERE id = @doctorID;
END;
Create PROCEDURE ReqLab(@DoctorID int ,@PatientID int,@labID int)  AS BEGIN	
		insert into Lab_tests values(@labID,@DoctorID)
		insert into lab_for  values(@labID,@DoctorID,@PatientID)
end 

Create PROCEDURE WritePres(@DoctorID int ,@PatientID int,@date Date)  AS BEGIN	
		insert into prescription values(@date,@DoctorID)
		insert into presc_for  values(@date,@DoctorID,@PatientID)
end
CREATE PROCEDURE addMobile(@id INT, @mobile INT)
AS
BEGIN
INSERT INTO Doc_Phone_numbers VALUES(@id, @mobile)
END

CREATE PROCEDURE Up(@id INT, @p_name VARCHAR(20), @age INT, @diet VARCHAR(20), @exercise VARCHAR(20), @emergency_name VARCHAR(20), @emergency_num VARCHAR(20), @p_password VARCHAR(20))
AS
BEGIN
UPDATE Patient 
SET p_name = @p_name, age = @age, diet = @diet, exercise = @exercise, emergency_name = @emergency_name, emergency_num = @emergency_num, p_password = @p_password
WHERE @id = Patient.id
END

CREATE PROCEDURE Up3(@id INT, @p_name VARCHAR(20), @age INT, @diet VARCHAR(20), @exercise VARCHAR(20), @emergency_name VARCHAR(20), @emergency_num VARCHAR(20), @p_password VARCHAR(20))
AS
BEGIN
UPDATE Patient 
SET p_name = @p_name, age = @age, diet = @diet, exercise = @exercise, emergency_name = @emergency_name, emergency_num = @emergency_num, p_password = @p_password WHERE @id = Patient.id
END

Create Procedure EditMyProfile(@ID INT, @p_name VARCHAR(20) = NULL ,@age int = -1 ,@diet VARCHAR(20) = NULL,@excercise VARCHAR(20) = NULL,@E_M VARCHAR(20) = NULL, @E_P VARCHAR(20) = NULL,@password VARCHAR(20) = NULL) 
		
	AS

	if(@p_name is NULL)
	Select @p_name = p_name
	from Patient
	where @id = id

	if(@age = -1)
	Select @age = age
	from Patient
	where @id = id

	if(@diet is NULL)
	Select @diet = diet
	from Patient
	where @id = id

	if(@excercise is NULL)
	Select @excercise = exercise
	from Patient
	where @id = id

	if(@E_M is NULL)
	Select @E_M = emergency_name
	from Patient
	where @id = id

	if(@E_P is NULL)
	Select @E_P = emergency_num
	from Patient
	where @id = id

	if(@password is NULL)
	Select @password = p_password
	from Patient
	where @id = id

	BEGIN
	UPDATE Patient
	SET p_name=@p_name ,age=@age,diet=@diet, exercise=@excercise,emergency_name=@E_M,emergency_num=@E_P, p_password=@password Where id=@ID
END

CREATE PROCEDURE userLogin(@id INT, @password VARCHAR(20), @success int Output, @type int Output) 
AS
BEGIN
	IF EXISTS (SELECT * FROM Doctor WHERE @password = d_password AND @id = id)
		Select @success = 1, @type = 1
	ELSE IF EXISTS (SELECT * FROM Patient WHERE @password = p_password AND @id = id)
		Select @success = 1, @type = 2
	ELSE IF EXISTS (SELECT * FROM Pharmacist WHERE @password = p_password AND @id = id)
		Select @success = 1, @type = 3
	ELSE IF EXISTS (SELECT * FROM Nurse WHERE @password = n_password AND @id = id)
		Select @success = 1, @type = 4
	ELSE
		Select @success = 0
	return @success
END

Create PROCEDURE MakeAppointment(@DoctorID int ,@PatientID int, @succ int Output)
	AS BEGIN	
	if NOT Exists((SELECT id from Doctor where @DoctorID=id)) OR NOT Exists((SELECT id from Patient where @PatientID=id)) 
		begin
		select @succ = 0
		end
	else
	begin
		insert into Make_appointment Values(@PatientID,@DoctorID) 
		select @succ = 1
	end
	return @succ
end

Create Procedure getDocID(@name varchar(20), @id int output) 
as 
begin
select @id = id from doctor where d_name = @name
return @id
end

*/
