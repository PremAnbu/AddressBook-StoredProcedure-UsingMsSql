use AddressBooks;
create table Contact
(ContactId int Identity(1,1) primary key,ContactFirstName varchar(30),ContactLastName varchar(30) ,
ContactPhoneNo int,ContactEmail varchar(30) ,ContactAddress varchar(50),ContactCity varchar(20),ContactState varchar(20)
,ContactZip int);

ALTER TABLE Contact
ALTER COLUMN ContactPhoneNo bigint;

--Contact Insert by Stored Procedure
Alter Proc spInsertContactDetails
@Fname varchar(30),@Lname varchar(30),@phno bigint,@email varchar(30),@address varchar(50),
@city varchar(20),@state varchar(20),@zip int
As
Begin
Insert into Contact(ContactFirstName,ContactLastName,ContactPhoneNo,ContactEmail,ContactAddress
,ContactCity,ContactState,ContactZip) values (@Fname,@Lname,@phno,@email,@address,@city,@state,@zip)
End

--Contact Update Stored Procedure
Alter Proc spUpdateContactDetailsById
@FnameUp varchar(30),@Fname varchar(30),@Lname varchar(30),@phno bigint,@email varchar(30),@address varchar(50),
@city varchar(20),@state varchar(20),@zip int
As
Begin
update Contact set ContactFirstName= @Fname,ContactLastName=@Lname,ContactPhoneNo=@phno,ContactEmail=@email,
ContactAddress=@address,ContactCity=@city,ContactState=@state,ContactZip=@zip where ContactFirstName=@FnameUp
End

--Contact Get by Stored Procedure
create Proc spGetContactDetails
As
Begin
select * from Contact
End

--Contact Delete by Stored Procedure
create Proc spDeleteContactDetailByName
@Fname varchar(30),@Lname varchar(30)
As
Begin
Delete from Contact where ContactFirstName=@Fname and ContactLastName=@Lname
End

select * from Contact;
	
sp_helptext spDeleteContactDetailsByName;