CREATE TABLE branch ( 
	branch_id integer not null PRIMARY KEY,
	branch_name varchar2(20) not null,
	branch_addr varchar2(50),
	branch_city varchar2(20) not null,
	branch_phone integer
);

INSERT INTO branch VALUES (4,'Q', '123 Main Street', 'Vancouver', '6041223456' );
