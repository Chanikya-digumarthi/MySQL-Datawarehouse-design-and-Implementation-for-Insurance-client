create schema ihps;

use ihps;

CREATE TABLE Company (
    Company_ID VARCHAR(20) NOT NULL,
    Company_Name varchar(20) NOT NULL,
    Phone_Number varchar(20) NOT NULL,
    Email varchar(30) NOT NULL,
    Location varchar(20) NOT NULL,
    PRIMARY KEY (Company_ID)
);



create table Insurance_Plan(
	Plan_ID varchar(20) NOT NULL,
    Plan_Name char(30) NOT NULL,
    Plan_Tenure int NOT NULL,
    Amount_Insured int NOT NULL,
	Monthly_Premium int GENERATED ALWAYS AS ((Amount_Insured/120)),
    Insurance_Provider_ID varchar(20) NOT NULL,
    Insurance_Provider_Name char(20) NOT NULL,
    PRIMARY KEY (Plan_ID)
    );
    
    
    
create table IHPS_Plan_Match(
	Match_ID varchar(10) not null,
    Plan_ID varchar(20) not null,
    Company_ID varchar(20) not null,
    PRIMARY KEY (Match_ID)
    );
    


create table Employee_Registrations(
	Registration_ID varchar(20) NOT NULL,
    Match_ID varchar(10) NOT NULL,
    Employee_Group_ID varchar(10) NOT NULL,
    Registration_Date date NOT NULL,
    PRIMARY KEY (Registration_ID)
    ); 
    
   
CREATE TABLE Employee(
    Employee_ID VARCHAR(10) NOT NULL,
    Company_ID varchar(20) not null,
    Company_Name varchar(20) not null,
    First_Name CHAR(30) NOT NULL,
    Last_Name CHAR(30) NOT NULL,
	Phone_Number varchar(20) NOT NULL,
    Employee_Email VARCHAR(30) NOT NULL,
    Salary int(10) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Employee_Group_ID varchar(10) Not Null,
    PRIMARY KEY (Employee_ID)
); 



create table Policy_Details(
	Policy_ID varchar(20) NOT NULL,
    Employee_ID varchar(10) NOT NULL, 
    Registration_ID varchar(20) NOT NULL,
    Employee_Group_ID varchar(20) NOT NULL,
    Match_ID varchar(20) NOT NULL,
    Start_Date date not null,
    End_Date date not null,
    Amount_claimed int not null,
    Number_of_Premiums_Paid varchar(10) not null,
    PRIMARY KEY (Policy_ID)
    ); 
    
ALTER TABLE Policy_Details
ADD FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID);
 
ALTER TABLE Policy_Details
ADD FOREIGN KEY (Registration_ID) REFERENCES Employee_Registrations(Registration_ID);

ALTER TABLE Employee_Registrations
ADD FOREIGN KEY (Match_ID) REFERENCES IHPS_Plan_Match(Match_ID);

ALTER TABLE IHPS_Plan_Match
ADD FOREIGN KEY (Plan_ID) REFERENCES Insurance_Plan(Plan_ID),
ADD FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID);
 
INSERT INTO 
	Insurance_Plan(Plan_ID, Plan_Name,Plan_Tenure,Amount_Insured,Insurance_Provider_ID,Insurance_Provider_Name)
VALUES
	('P01','Aetna Medicare', '12', '200000','AW1234', 'Aetna'),
    ('P02','Blue Choice', '12', '400000',  'BL1234', 'BlueCross'),
    ('P03','Cigna Health Plus', '12', '250000','CI2132','Cigna'),
    ('P04','Medigap', '12', '300000',  'HD4153', 'Humana'),
    ('P05','HealthFocuzzz', '12', '600000',  'HP3634', 'Harvard Piligrim'),
    ('P06','United Premium', '12', '500000',  'UH4858', 'United Health Care'),
    ('P07','Cigna Health Advantage', '12', '350000',  'CI2005', 'Cigna'),
    ('P08','Blue Care', '12', '200000',  'BL5845', 'BlueCross'),
    ('P09','Aetna MedPlus', '12', '600000',  'AW9058', 'Aetna'),
    ('P10','Uconn Robust', '12', '350000',  'U2010', 'UCONN');
    
    
INSERT INTO 
	Company(Company_ID,Company_Name, Phone_Number,Email,Location)
VALUES
	('C01','Synchrony','8664194096','help@mail.synchronybank.com','Stamford'),
    ('C02','Wells Fargo','8008693557','help@wellsforgo.com','New York'),
    ('C03','Gotham Sales Inc','2033270843','help@mail.gothamsales.com', 'Greenwhich'),
    ('C04','Gretan','4047895241','Servicing@mail.gretan.com','Stamford'),
    ('C05','Cognizant','8057469874','inquiry@cognizant.com','Texas'),
    ('C06','Hartford Health','2035874596','support@hhchealth.org','Hartford'),
    ('C07','Amazon','2587419635','help@amazon.com','Seattle'),
    ('C08','Google','4587898521','help@mail.google.com','Seattle'),
    ('C09','Tesla','2014569087','North America. Press@tesla.com','California'),
    ('C10','Facebook','2005804136','support@fb.com','New York');
    
    
INSERT INTO 
	IHPS_Plan_Match(Match_ID,Company_ID,Plan_ID)
VALUES
	('M01','C01','P01'),
    ('M02','C01','P02'),
    ('M03','C01','P03'),
    ('M04','C02','P02'),
    ('M05','C02','P04'),
    ('M06','C03','P01'),
    ('M07','C03','P05'),
    ('M08','C01','P08'),
    ('M09','C02','P09'),
    ('M10','C03','P10');
    
INSERT INTO 
	Employee_Registrations(Registration_ID,Match_ID,Employee_Group_ID,Registration_Date)
VALUES
	('R01','M01','G01','2021-04-04'),
    ('R02','M04','G02','2021-04-10'),
    ('R03','M07','G03','2021-04-11');
    
INSERT INTO 
	Employee()
VALUES
	('01','C01','Synchrony','Chris','Rock','2034678899','chris22@synchrony.com','55000','HudsonPL','G01'),
    ('02','C01','Synchrony','Robert','Pattinson','2034789878','robert_79@synchrony.com','65000','LinconSt','G01'),
    ('03','C01','Synchrony','Tony','Stark','2873467889','stark@synchrony.com','55000','Atlantic Palace','G01'),
    ('04','C01','Synchrony','Steve','Rogers','6430299887','rogers77@synchrony.com','60000','ELMStreet','G01'),
    ('05','C02','Wells Fargo','Natasha','Romonoff','8677491967','natasha_2@wellsfargo.com','50000','Bell Street','G02'),
    ('06','C02','Wells Fargo','John','Cena','8978725710','john98@wellsfargo.com','75000','NorwayPL','G02'),
    ('07','C02','Wells Fargo','Randa','Vision','9014678954','randa3@wellsfargo.com','49500','ProspectSt','G02'),
    ('08','C03','Gotham Sales Inc','Bruce','Banners','5034678899','banners@gothamsales.com','80000','WashingtonSt','G03'),
    ('09','C03','Gotham Sales Inc','Thor','Odinson','7643027869','thor@gothamsales.com','90000','WashingtonSt','G03'),
    ('10','C03','Gotham Sales Inc','Scott','Lang','3412345467','lang@gothamsales.com','75000','HogwardSt','G03'),
    ('11','C03','Gotham Sales Inc','Steven','Strange','5827419635','steve@gothamsales.com','75000','HogwardSt','G03');  
    
INSERT INTO 
	Policy_Details(Policy_ID,Employee_ID,Registration_ID,Employee_Group_ID,Match_ID,Start_Date,End_Date,Amount_Claimed,Number_of_Premiums_Paid)
VALUES
	('POL01','01','R01','G01','M01','2021-05-04','2022-05-03','0','11'),
    ('POL02','02','R01','G01','M01','2021-05-04','2022-05-03','60000','11'),
    ('POL03','03','R01','G01','M01','2021-05-04','2022-05-03','24000','11'),
    ('POL04','04','R01','G01','M01','2021-05-04','2022-05-03','10000','11'),
    ('POL05','05','R02','G02','M04','2021-05-10','2022-05-09','12225','11'),
    ('POL06','06','R02','G02','M04','2021-05-10','2022-05-09','34685','11'),
    ('POL07','07','R02','G02','M04','2021-05-10','2022-05-09','45624','11'),
    ('POL08','08','R03','G03','M07','2021-05-11','2022-05-10','69424','11'),
    ('POL09','09','R03','G03','M07','2021-05-11','2022-05-10','78921','11'),
    ('POL10','10','R03','G03','M07','2021-05-11','2022-05-10','84658','11');
    
 
INSERT INTO 
	Employee()
	VALUES
		('12','C10','Facebook','John','Snow','4445567890','snow@facebook.com','89000','BedfordSt','G04'),
		('13','C10','Facebook','Daenerys','Targaryen','2358907657','targaryen@facebook.com','95000','Norwalk','G04'),
		('14','C10','Facebook','Edward','Stark','8574961425','edward@facebook.com','79000','Newhaven','G04'),
		('15','C09','Tesla','Jamie','Lannister','6547896547','jamie@tesla.com','89700','Hartford','G05'),
		('16','C09','Tesla','Robert','Stark','2587419631','stark@tesla.com','86000','Stratford','G05'),
		('17','C09','Tesla','Pedri','Hellro','2587419635','pedri@tesla.com','101000','Prospect','G05'),
		('18','C09','Tesla','Jessi','Pinkman','2103658795','jessi@tesla.com','88000','EdwardSt','G06'),
		('19','C09','Tesla','Walter','White','8524749630','walter@tesla.com','98000','BedfordSt','G06'),
		('20','C09','Tesla','Skyler','White','9874561230','skyler@tesla.com','66684','BedfordSt','G06'); 
        
INSERT INTO 
	IHPS_Plan_Match(Match_ID,Plan_ID,Company_ID)
VALUES
	('M11','P01','C04'),
    ('M12','P03','C04'),
    ('M13','P04','C04'),
    ('M14','P05','C10'),
    ('M15','P07','C10'),
    ('M16','P09','C10');
    
INSERT INTO 
	Employee_Registrations(Registration_ID,Match_ID,Employee_Group_ID,Registration_Date)
VALUES
	('R04','M12','G04','2021-03-11'),
    ('R05','M16','G05','2021-07-08'),
    ('R06','M13','G06','2021-08-05');
    
INSERT INTO 
	Policy_Details(Policy_ID,Employee_ID,Registration_ID,Employee_Group_ID,Match_ID,Start_Date,End_Date,Amount_claimed,Number_of_Premiums_Paid)
VALUES
	('POL11','11','R04','G04','M12','2021-04-11','2022-04-10','90000','12'),
	('POL12','12','R04','G04','M12','2021-04-11','2022-04-10','23000','12'),
	('POL13','13','R04','G04','M12','2021-04-11','2022-04-10','100000','12'),
    ('POL14','14','R05','G05','M16','2021-08-08','2022-08-07','0','4'),
    ('POL15','15','R05','G05','M16','2021-08-08','2022-08-07','50000','3'),
    ('POL16','16','R05','G05','M16','2021-08-08','2022-08-07','0','7'),
    ('POL17','17','R06','G06','M13','2021-09-05','2022-09-04','50000','6'),
    ('POL18','18','R06','G06','M13','2021-09-05','2022-09-04','0','3'),
    ('POL19','19','R06','G06','M13','2021-09-05','2022-09-04','0','5');    
    
--------------------------------------------------------------
select concat(e.first_name,' ',e.last_name) as Employee_name,e.employee_email ,e.employee_group_id,e.company_name,i.plan_id,ip.plan_name,
ip.insurance_provider_name,
case
  when DATEDIFF(p.end_date,sysdate())<=30 then concat("Policy ends in ",DATEDIFF(p.end_date,sysdate()),' days')
  else concat(ip.monthly_premium," is the montly premium due")
end as Remainders
from employee e join policy_details p on e.employee_group_id=p.employee_group_id 
join employee_registrations r on p.registration_id=r.registration_id 
join IHPS_plan_match i on r.match_id=i.match_id
join insurance_plan ip on i.plan_id=ip.plan_id
group by e.employee_id;
--------------------------------------------------------------------

select e.first_name,e.last_name, p.policy_id ,ipm.plan_id,ip.plan_name, ip.amount_insured,
(p.number_of_premiums_paid * ip.monthly_premium) as Total_Premium_Paid,
p.amount_claimed,
case
  when
      ((p.number_of_premiums_paid * ip.monthly_premium) - p.amount_claimed) > 0 Then "Customer claimed LESS than the total premium  paid"
  else 
      "Customer claimed MORE than the total premium paid"
END AS customer_category
from employee e, policy_details p, employee_registrations er, ihps_plan_match ipm , insurance_plan ip
where  e.employee_id = p.employee_id
and p.registration_id = er.registration_id
and er.match_id = ipm.match_id
and ipm.plan_id = ip.plan_id
and p.employee_id in (select p.employee_id from policy_details p where DATEDIFF(p.end_date,sysdate())<30);

----------------------------------------------------------
select c.company_id, c.company_name,ip.plan_name,ip.insurance_provider_name from company c, ihps_plan_match ipm , insurance_plan ip
where c.company_id = ipm.company_id
and ipm.plan_id = ip.plan_id
and ipm.plan_id in (
select plan_id from insurance_plan where plan_id not  in (
select distinct ip.plan_id
from employee e, policy_details p, employee_registrations er, ihps_plan_match ipm , insurance_plan ip, Company c
where  e.employee_id = p.employee_id
and p.registration_id = er.registration_id
and er.match_id = ipm.match_id
and ipm.plan_id = ip.plan_id));
-----------------------------------------------------
select e.employee_id,pd.policy_id,concat(e.first_name, ' ' ,e.last_name) Employee_Name ,e.employee_email,pd.start_date,pd.end_date,e.company_name, c.email,
concat('Employee has been removed as the policy was expired on ', pd.end_date)  No_Reply_Notification
from employee e, policy_details pd, company c
where e.employee_id = pd.employee_id
and e.company_id = c.company_id
and end_date < sysdate()
union all
select e.employee_id,pd.policy_id,concat(e.first_name, ' ' ,e.last_name) Employee_Name ,e.employee_email,pd.start_date,pd.end_date,e.company_name, c.email,
concat('Employee has not paid premium for ',(TIMESTAMPDIFF(MONTH, pd.start_date, sysdate()) - pd.number_of_premiums_paid),' months. Hence, removed from the policy' )  No_Reply_Notification
from employee e, policy_details pd, company c 
where e.employee_id = pd.employee_id
and e.company_id = c.company_id
and (TIMESTAMPDIFF(MONTH, pd.start_date, sysdate()) - pd.number_of_premiums_paid) > 2;

--------------------------------------------------------------

select ip.insurance_provider_name, ip.plan_id, ip.plan_name, ipm.company_id, c.company_name, 
sum(pd.number_of_premiums_paid*ip.monthly_premium) Total_Revenue, count(pd.employee_id) Number_of_Employees from insurance_plan ip 
right join ihps_plan_match ipm on ipm.plan_id = ip.plan_id
left join company c on ipm.company_id = c.company_id
left join  employee_registrations er on ipm.match_id = er.match_id
left join policy_details pd on er.registration_id = pd.registration_id
group by ip.plan_id;




      



    


