-- 3

CREATE TABLE Staff (
    StaffID NUMBER PRIMARY KEY,
    DepartmentID NUMBER NOT NULL,
    StaffFullName VARCHAR2(100) NOT NULL,
    JoinedDate DATE NOT NULL,
    StaffEmail VARCHAR2(100) NOT NULL,
    StaffphoneNumber VARCHAR2(15) NOT NULL CHECK (LENGTH(StaffphoneNumber) = 10),
    StaffAddress VARCHAR2(200) NOT NULL,
    StaffSalary NUMBER(10, 2) NOT NULL CHECK (StaffSalary > 0),
    
    CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (1, 1, 'Nimal Perera', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'nimal.perera@gmail.com', '0721234567', '123, Main St, Colombo 4', 50000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (2, 1, 'Chandana Silva', TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'chandana.silva@yahoo.com', '0722345678', '456, Galle Rd, Kandy', 48000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (3, 1, 'Saman Kumara', TO_DATE('2019-03-10', 'YYYY-MM-DD'), 'saman.kumara@gmail.com', '0723456789', '789, Lake View, Galle', 52000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (4, 1, 'Dilani Mendis', TO_DATE('2022-04-25', 'YYYY-MM-DD'), 'dilani.mendis@hotmail.com', '0724567890', '321, Hill St, Negombo', 49000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (5, 2, 'Kamal Perera', TO_DATE('2020-05-15', 'YYYY-MM-DD'), 'kamal.perera@gmail.com', '0725678901', '654, Fort Rd, Colombo 1', 55000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (6, 2, 'Sasika Jayasinghe', TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'sasika.jayasinghe@yahoo.com', '0726789012', '789, Market St, Kandy', 53000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (7, 2, 'Nimali Wickramasinghe', TO_DATE('2019-07-10', 'YYYY-MM-DD'), 'nimali.wickramasinghe@gmail.com', '0727890123', '135, High St, Galle', 50000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (8, 2, 'Anura Bandara', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'anura.bandara@hotmail.com', '0728901234', '246, Old Rd, Negombo', 51000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (9, 3, 'Tharindu Silva', TO_DATE('2020-03-15', 'YYYY-MM-DD'), 'tharindu.silva@gmail.com', '0729012345', '321, River St, Colombo 5', 48000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (10, 3, 'Dinesh Fernando', TO_DATE('2021-01-20', 'YYYY-MM-DD'), 'dinesh.fernando@yahoo.com', '0720123456', '456, Main Rd, Kandy', 49000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary)
VALUES (11, 3, 'Shanika Jayasinghe', TO_DATE('2019-02-10', 'YYYY-MM-DD'), 'shanika.jayasinghe@gmail.com', '0721234560', '789, Market St, Galle', 50000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (12, 3, 'Kasun Lakshman', TO_DATE('2022-04-05', 'YYYY-MM-DD'), 'kasun.lakshman@hotmail.com', '0722345671', '321, Beach Rd, Negombo', 51000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (13, 4, 'Dulani Amarasinghe', TO_DATE('2020-06-15', 'YYYY-MM-DD'), 'dulani.amarasinghe@gmail.com', '0723456782', '654, High St, Colombo 6', 47000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (14, 4, 'Kavinda Gunaratne', TO_DATE('2021-05-20', 'YYYY-MM-DD'), 'kavinda.gunaratne@yahoo.com', '0724567893', '789, New Rd, Kandy', 48000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (15, 4, 'Suranga Perera', TO_DATE('2019-04-10', 'YYYY-MM-DD'), 'suranga.perera@gmail.com', '0725678904', '321, Sea View Rd, Galle', 49000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (16, 4, 'Priyanka Samarasinghe', TO_DATE('2022-03-25', 'YYYY-MM-DD'), 'priyanka.samarasinghe@hotmail.com', '0726789015', '654, Forest Rd, Negombo', 46000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (17, 5, 'Vijitha Perera', TO_DATE('2020-07-15', 'YYYY-MM-DD'), 'vijitha.perera@gmail.com', '0727890126', '123, City Center, Colombo 7', 54000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (18, 5, 'Rukshan Jayasinghe', TO_DATE('2021-08-20', 'YYYY-MM-DD'), 'rukshan.jayasinghe@yahoo.com', '0728901237', '456, Commercial Rd, Kandy', 52000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (19, 5, 'Heshani Kumari', TO_DATE('2019-09-10', 'YYYY-MM-DD'), 'heshani.kumari@gmail.com', '0729012348', '789, College Rd, Galle', 53000.00);

INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffphoneNumber, StaffAddress, StaffSalary) 
VALUES (20, 5, 'Tashan Bandara', TO_DATE('2022-10-25', 'YYYY-MM-DD'), 'tashan.bandara@hotmail.com', '0720123459', '321, Main St, Negombo', 51000.00);


SELECT * FROM staff;