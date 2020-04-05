drop table branch;
drop table AHC1;
drop table AHC2;
drop table DCA2;
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
                      status CHAR(10) not null
                  );

CREATE TABLE AHC2 (
                      AID INTEGER,
                      Address CHAR(40),
                      PRIMARY KEY (AID, Address),
                      foreign key (AID) REFERENCES AHC1
                          ON DELETE CASCADE,
                      foreign key (Address) REFERENCES  AHC3
                          ON DELETE CASCADE
);

CREATE TABLE AHC3 (
                      Address CHAR(40) primary key ,
                      Phone CHAR(20),
                      Email CHAR(40)
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
                      Blood_Type CHAR(2),
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
                    BloodType CHAR(2),
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
                                 Address CHAR(40));



INSERT INTO branch VALUES (4,'Q', '123 Main Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (3,'D', '123 MGain Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (2,'S', '123 Sain Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (1,'G', '123 MaSSGin Street', 'Vancouver', '6041223456' );


INSERT INTO AHC1 VALUES (111,'test user', '123456','Donor');
INSERT INTO DCA2 VALUES (111, 16, 'F', 'Lisa', 'B');
INSERT INTO AHC1 VALUES (222, 'yuyi', '123456', 'Donor');
INSERT INTO DCA2 VALUES (222, 21, 'F', 'Yuyi', 'O');



