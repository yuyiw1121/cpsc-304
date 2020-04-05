drop table branch;
drop table AHC2;
drop table DCA2;
drop table Medical_History;
drop table Transaction_Record;
drop table EmployeeApprove;
drop table EmployeeMonitor;
drop table Employee;
drop table DCA1;
drop table Request2;
drop table Request1;
drop table RCA1;
drop table RCA2;
drop table Location;
drop table AHC1;
drop table AHC3;


CREATE TABLE branch (
	branch_id integer not null PRIMARY KEY,
	branch_name varchar2(20) not null,
	branch_addr varchar2(50),
	branch_city varchar2(20) not null,
	branch_phone integer
);

CREATE TABLE AHC1 (
                      AID INTEGER primary key ,
                      Username CHAR(40) unique ,
                      Password CHAR(40) not null,
                      accountType CHAR(10) not null,
                      status CHAR(30) not null
                  );

CREATE TABLE AHC3 (
                      Address CHAR(40) primary key ,
                      Phone CHAR(20),
                      Email CHAR(40)
);

CREATE TABLE AHC2 (
                      AID INTEGER,
                      Address CHAR(40),
                      PRIMARY KEY (AID, Address),
                      foreign key (AID) REFERENCES AHC1
                          ON DELETE CASCADE,
                      foreign key (Address) REFERENCES AHC3
                          ON DELETE CASCADE
);

CREATE TABLE DCA1 (
                      DHCID INTEGER primary key ,
                      AID INTEGER,
                      FOREIGN KEY (AID) REFERENCES AHC1
                          ON DELETE CASCADE);


CREATE TABLE DCA2 (
                      AID INTEGER PRIMARY KEY,
                      Age INTEGER,
                      Gender CHAR(10),
                      Name CHAR(40),
                      Blood_Type CHAR(3),
                      foreign key (AID) REFERENCES AHC1
                          ON DELETE CASCADE
);


CREATE TABLE Medical_History (
                                 MDID INTEGER PRIMARY KEY ,
                                 DHCID INTEGER,
                                 Status CHAR(20),
                                 Description CHAR(40),
                                 FOREIGN KEY (DHCID) REFERENCES DCA1
                                     ON DELETE CASCADE);


CREATE TABLE RCA1 (
                      RHCID INTEGER primary key ,
                      AID INTEGER,
                      FOREIGN KEY (AID) REFERENCES AHC1
                          ON DELETE CASCADE );


CREATE TABLE RCA2 (
                      AID INTEGER,
                      Age INTEGER,
                      Gender CHAR(10),
                      Name CHAR(40),
                      FOREIGN KEY (AID) REFERENCES AHC1
                          ON DELETE CASCADE);

CREATE TABLE Location (
                          Address CHAR(40) PRIMARY KEY ,
                          Name CHAR(40)
                     );

CREATE TABLE Transaction_Record (
                                    TID INTEGER PRIMARY KEY ,
                                    transactionDate DATE,
                                    DHCID INTEGER,
                                    RHCID INTEGER,
                                    Address CHAR(40),
                                    FOREIGN KEY (DHCID) REFERENCES DCA1,
                                    FOREIGN KEY (RHCID) REFERENCES RCA1,
                                    FOREIGN KEY (Address) REFERENCES Location );

CREATE TABLE Request1 (
                    RID INTEGER PRIMARY KEY ,
                    RHCID INTEGER,
                    FOREIGN KEY (RHCID) REFERENCES RCA1
                        ON DELETE CASCADE);

CREATE TABLE Request2 (
                    RID INTEGER PRIMARY KEY ,
                    BloodType CHAR(3),
                    Amount INTEGER,
                    requestTime DATE,
                    Description CHAR(40),
                    FOREIGN KEY (RID) REFERENCES Request1
                        ON DELETE CASCADE );


CREATE TABLE Employee (
                          EID INTEGER PRIMARY KEY ,
                          Name CHAR(40),
                          Email CHAR(40) );

CREATE TABLE EmployeeApprove (
                                 EID INTEGER PRIMARY KEY ,
                                 DHCID INTEGER,
                                 FOREIGN KEY (EID) REFERENCES Employee,
                                 FOREIGN KEY (DHCID) REFERENCES DCA1
);

CREATE TABLE EmployeeMonitor (
                                 EID INTEGER PRIMARY KEY ,
                                 DHCID INTEGER,
                                 RHCID INTEGER,
                                 Address CHAR(40),
                                 FOREIGN KEY (DHCID) REFERENCES DCA1,
                                 FOREIGN KEY (RHCID) REFERENCES RCA1
                             );



INSERT INTO branch VALUES (4,'Q', '123 Main Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (3,'D', '123 MGain Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (2,'S', '123 Sain Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (1,'G', '123 MaSSGin Street', 'Vancouver', '6041223456' );


INSERT INTO AHC1 VALUES (111,'test user', '123456','Donor', 'approved');
INSERT INTO DCA2 VALUES (111, 16, 'F', 'Lisa', 'B');
INSERT INTO AHC1 VALUES (222, 'yuyi', '123456', 'Donor', 'approved');
INSERT INTO DCA2 VALUES (222, 21, 'F', 'Yuyi', 'O');

INSERT INTO AHC1
VALUES (1111, '1@1', '1pass', 'Donor', 'approved');

INSERT INTO AHC1
VALUES (2222, '2@2', '22pass', 'Donor', 'approved');

INSERT INTO AHC1
VALUES (3333, '3@3', '333pass', 'Donor', 'approved');

INSERT INTO AHC1
VALUES (4444, '4@4', '4444pass', 'Donor', 'approved');

INSERT INTO AHC1
VALUES (5555, '5@5', '55555pass', 'Donor', 'approved');

INSERT INTO AHC1
VALUES (1234, '6@6', '666pass', 'Receiver', 'approved');

INSERT INTO AHC1
VALUES (2345, '7@7', '777pass', 'Receiver', 'approved');

INSERT INTO AHC1
VALUES (3456, '8@8', '888pass', 'Receiver', 'not approved');

INSERT INTO AHC1
VALUES (4567, '9@9', '999pass', 'Receiver', 'approved');

INSERT INTO AHC1
VALUES (5678, '10@10', '101010pass', 'Receiver', 'approved');


INSERT INTO AHC3
VALUES ('123 Main Street', '111-222-3333', 'amy@gmail.com');

INSERT INTO AHC3
VALUES ('758 West Street', '000-000-0000', 'abby@gmail.com');

INSERT INTO AHC3
VALUES ('3333 Main Street', '333-333-3333', 'paul@gmail.com');

INSERT INTO AHC3
VALUES ('4444 Main Street', '444-444-4444', 'cath@gmail.com');

INSERT INTO AHC3
VALUES ('5555 Main Street', '555-555-5555', 'mike@gmail.com');

INSERT INTO AHC3
VALUES ('6666 West Street', '666-666-6666', 'joel@gmail.com');

INSERT INTO AHC3
VALUES ('7777 Main Street', '777-777-7777', 'david@gmail.com');

INSERT INTO AHC3
VALUES ('8888 West Street', '888-888-8888', 'may@gmail.com');

INSERT INTO AHC3
VALUES ('9999 South Street', '999-999-9999', 'chad@gmail.com');

INSERT INTO AHC3
VALUES ('1000 Main Street', '101-101-1010', 'jackson@gmail.com');


INSERT INTO AHC2
VALUES (1111, '123 Main Street');

INSERT INTO AHC2
VALUES (2222, '758 West Street');

INSERT INTO AHC2
VALUES (3333, '4444 Main Street');

INSERT INTO AHC2
VALUES (4444, '4444 Main Street');

INSERT INTO AHC2
VALUES (5555, '5555 Main Street');

INSERT INTO AHC2
VALUES (1234, '6666 West Street');

INSERT INTO AHC2
VALUES (2345, '7777 Main Street');

INSERT INTO AHC2
VALUES (3456, '8888 West Street');

INSERT INTO AHC2
VALUES (4567, '9999 South Street');

INSERT INTO AHC2
VALUES (5678, '1000 Main Street');


INSERT INTO DCA1
VALUES (1111111111, 1111);

INSERT INTO DCA1
VALUES (2222222222, 2222);

INSERT INTO DCA1
VALUES (3333333333, 3333);

INSERT INTO DCA1
VALUES (4444444444, 4444);

INSERT INTO DCA1
VALUES (5555555555, 5555);


INSERT INTO DCA2
VALUES (1111, 20, 'F', 'Amy', 'A+');

INSERT INTO DCA2
VALUES (2222, 44, 'F', 'Abby', 'B-');

INSERT INTO DCA2
VALUES (3333, 23, 'M', 'Paul', 'AB-');

INSERT INTO DCA2
VALUES (4444, 25, 'F', 'Cath', 'O+');

INSERT INTO DCA2
VALUES (5555, 30, 'M', 'Mike', 'A-');


INSERT INTO Medical_History
VALUES (1, 1111111111, 'approved', 'Meets criteria');

INSERT INTO Medical_History
VALUES (2, 2222222222, 'approved', 'Meets criteria');

INSERT INTO Medical_History
VALUES (3, 3333333333, 'approved', 'Meets criteria');

INSERT INTO Medical_History
VALUES (4, 4444444444, 'approved', 'Meets criteria');

INSERT INTO Medical_History
VALUES (5, 5555555555, 'approved', 'Meets criteria');


INSERT INTO RCA1
VALUES (1111111111, 1234);

INSERT INTO RCA1
VALUES (2222222222, 2345);

INSERT INTO RCA1
VALUES (3333333333, 3456);

INSERT INTO RCA1
VALUES (4444444444, 4567);

INSERT INTO RCA1
VALUES (5555555555, 5678);


INSERT INTO RCA2
VALUES (1234, 23, 'M', 'Joel');

INSERT INTO RCA2
VALUES (2345, 21, 'M', 'David');

INSERT INTO RCA2
VALUES (3456, 45, 'F', 'May');

INSERT INTO RCA2
VALUES (4567, 67, 'M', 'Chad');

INSERT INTO RCA2
VALUES (5678, 42, 'M', 'Jackson');


INSERT INTO Location
VALUES ('A Hospital', 'Central Hospital One');

INSERT INTO Location
VALUES ('B Hospital', 'Central Hospital Two');

INSERT INTO Location
VALUES ('C Hospital', 'Central Hospital Three');

INSERT INTO Location
VALUES ('D Hospital', 'Central Hospital Four');

INSERT INTO Location
VALUES ('E Hospital', 'Central Hospital Five');


INSERT INTO Transaction_Record
VALUES (23, '2020-06-01', 1111111111, 5555555555, 'A Hospital');

INSERT INTO Transaction_Record
VALUES (12, '2020-05-02', 2222222222, 4444444444, 'A Hospital');

INSERT INTO Transaction_Record
VALUES (34, '2020-07-03', 3333333333, 2222222222, 'C Hospital');

INSERT INTO Transaction_Record
VALUES (24, '2020-08-07', 4444444444, 3333333333, 'D Hospital');

INSERT INTO Transaction_Record
VALUES (36, '2020-10-12', 5555555555, 1111111111, 'B Hospital');


INSERT INTO Request1
VALUES (1234, 1111111111);

INSERT INTO Request1
VALUES (2345, 2222222222);

INSERT INTO Request1
VALUES (3456, 3333333333);

INSERT INTO Request1
VALUES (4567, 4444444444);

INSERT INTO Request1
VALUES (5678, 5555555555);


INSERT INTO Request2
VALUES (1234, 'O+', 300, '2020-06-01', 'approved');

INSERT INTO Request2
VALUES (2345, 'A-', 350, '2020-05-02', 'approved');

INSERT INTO Request2
VALUES (3456, 'B+', 400, '2020-07-03', 'approved');

INSERT INTO Request2
VALUES (4567, 'AB+', 450, '2020-08-02', 'approved');

INSERT INTO Request2
VALUES (5678, 'A-', 500, '2020-10-12', 'approved');


INSERT INTO Employee
VALUES (314, 'June', 'june@gmail.com');

INSERT INTO Employee
VALUES (454, 'Jenny', 'jenny@gmail.com');

INSERT INTO Employee
VALUES (575, 'Liam', 'liam@gmail.com');

INSERT INTO Employee
VALUES (283, 'Ben', 'ben@gmail.com');

INSERT INTO Employee
VALUES (569, 'Mark', 'mark@gmail.com');


INSERT INTO EmployeeApprove
VALUES (314, 1111111111);

INSERT INTO EmployeeApprove
VALUES (454, 2222222222);

INSERT INTO EmployeeApprove
VALUES (575, 3333333333);

INSERT INTO EmployeeApprove
VALUES (283, 4444444444);

INSERT INTO EmployeeApprove
VALUES (569, 5555555555);


INSERT INTO EmployeeMonitor
VALUES (313, 1111111111, 5555555555, 'A Hospital');

INSERT INTO EmployeeMonitor
VALUES (454, 2222222222, 4444444444, 'A Hospital');

INSERT INTO EmployeeMonitor
VALUES (575, 3333333333, 2222222222, 'C Hospital');

INSERT INTO EmployeeMonitor
VALUES (283, 4444444444, 3333333333, 'D Hospital');

INSERT INTO EmployeeMonitor
VALUES (569, 5555555555, 1111111111, 'B Hospital');


