
drop table AHC1;
drop table DCA2;

CREATE TABLE branch (
	branch_id integer not null PRIMARY KEY,
	branch_name varchar2(20) not null,
	branch_addr varchar2(50),
	branch_city varchar2(20) not null,
	branch_phone integer
);

CREATE TABLE DCA2 (
                      AID int PRIMARY KEY,
                      Age INTEGER,
                      Gender CHAR(10),
                      Name CHAR(40),
                      Blood_Type CHAR(2)
);


CREATE TABLE AHC1 (
                      AID int,
                      Username CHAR(40),
                      Password CHAR(40),
                      Address CHAR(40),
                      PRIMARY KEY (AID),
                      foreign key (AID) REFERENCES DCA2
                          ON DELETE CASCADE
);



INSERT INTO branch VALUES (4,'Q', '123 Main Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (3,'D', '123 MGain Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (2,'S', '123 Sain Street', 'Vancouver', '6041223456' );
INSERT INTO branch VALUES (1,'G', '123 MaSSGin Street', 'Vancouver', '6041223456' );

INSERT INTO DCA2 VALUES (111, 16, 'F', 'Lisa', 'B');
INSERT INTO AHC1 VALUES (111,'test user', '123456','123 Main Street');

