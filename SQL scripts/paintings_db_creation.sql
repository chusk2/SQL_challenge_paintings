-- This file contains the SQL queries to create the tables for the paintings database
-- https://github.com/chusk2/SQL_challenge_paintings

create database paintings ;
use paintings ;


/* Due to the different relationships (primary and
foreign keys structure), the tables must be
created in the following order. Altering the
creation order may result in tables related
to a table that has not been created yet */

-- TABLE MUSEUM
create table museum (
museum_id int primary key,
name varchar(255),
address varchar(255),
city varchar(255),
state varchar(255),
postal varchar(255),
country varchar(255),
phone varchar(255),
url varchar(255)
) ;

-- TABLE ARTIST
create table artist (
artist_id int primary key,
full_name varchar(255),
first_name varchar(255),
middle_names varchar(255),
last_name varchar(255),
nationality varchar(255),
style varchar(255),
birth int,
death int
) ;

-- TABLE WORK
create table work (
work_id int primary key,
name varchar(255), 
artist_id int, 
style varchar(255), 
museum_id int,
foreign key (artist_id) references artist (artist_id),
foreign key (museum_id) references museum (museum_id)
) ;

-- TABLE CANVAS_SIZE
create table canvas_size (
size_id int primary key,
width int,
height int,
label varchar(255)
) ;

-- TABLE PRODUCT_SIZE
create table product_size (
/* since the product_size dataset
contains missing values for size_id and
work_id is a foreign key, I will create a
subrogate primary key using AUTO_INCREMENT */
product_size_id int primary key AUTO_INCREMENT,
work_id int,
size_id int,
sale_price int,
regular_price int,
foreign key (work_id) references work (work_id),
foreign key (size_id) references canvas_size (size_id)
) ;

-- TABLE SUBJECT
create table subject (
work_id int, 
subject varchar(255),
primary key (work_id, subject),
foreign key (work_id) references work (work_id)
) ;

-- TABLE MUSEUM_HOURS
create table museum_hours (
museum_id int, 
day varchar(255),
primary key (museum_id, day),
open varchar(255), 
close varchar(255),
foreign key (museum_id) references museum (museum_id)
) ;

-- TABLE IMAGE_LINK
create table image_link (
work_id int, 
/* url values are extremely long,
so we use varchar(500) to store them */
url varchar(500),
primary key (work_id, url),
thumbnail_small_url varchar(255), 
thumbnail_large_url varchar(255),
foreign key (work_id) references work (work_id)
) ;
