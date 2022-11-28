use sales; -- use sales database

 -- we drop a table because we want to add a foreign key, so the drop table can be anywhere
 
create table sales 
(Purchase_number INT,
Date_of_purchase date not null,
Customer_id int,
Item_code varchar(10) not null,
 primary key (purchase_number),
 foreign key(customer_id) references customers(customer_id) on delete cascade); -- foreign key referenced from the customer table
  -- drop table sales
  -- drop table sales.customers;
  -- before you add foreign key drop the table(with the primary key) related to it then rerun the create table with the foreign key
-- you can decide not to drop the table, bt alter the table and add foreign key which is better
-- on delete cascade means when you delete from parent table it automatically deletes from child's table

alter table sales
add foreign key(customer_id) references customers(customer_id) on delete cascade;
-- refrencing customer_id column in customer table
 
create table customers
(customer_id int auto_increment,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key (customer_id));

-- WHEN YOU'VE ALREADY CREATED CUSTOMERS TABLE AND YOU WANT TO ADD UNIQUE KEY OR OTHER THINGS
alter table customers
add unique key (email_address);
ALTER TABLE customers 
ADD COLUMN gender ENUM('M', 'F') AFTER last_name; 
INSERT INTO customers (customer_id,first_name, last_name, gender, email_address, number_of_complaints) -- insert into tables
VALUES (0,'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);        -- adding values


  -- to add a default key to it
alter table customers
change column number_of_complaints number_of_complaints int default 0 ;
-- write the key you are trying to alter twice
show tables from sales; -- command to show tables

-- using drop table method
-- we want to add foreign key we write the foreign key code, the code will run from create table
-- to primary key area and not read the primary key side, though we waill still write it then
-- drop table then rerun it again
create table sales.items
(item_code varchar(255) not null,
item varchar(255) not null,
unit_price numeric(10,2) not null,
company_id varchar(255) not null,
PRIMARY KEY (item_code),
foreign key(company_id) references company(company_id) on delete cascade); -- when we

drop table sales.items;-- drop table then rereun sales.items table again

create table sales.company
(company_id int not null auto_increment,
company_name varchar(255) not null,
headquarters_phone_number int(12) not null,
PRIMARY KEY (company_id));

alter table sales.company
modify headquarters_phone_number varchar(255) not null;

alter table sales.company
modify headquartes_phone_number varchar(255) default "X";

alter table sales.company
modify headquarters_phone_number varchar(255) null;

alter table sales.company
change column headquarters_phone_number headquarters_phone_number varchar(255) not null;





