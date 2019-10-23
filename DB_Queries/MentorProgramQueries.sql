create database mentorprogram;
use mentorprogram;

-- Mentor Data
CREATE TABLE mentor_data    
(mentor_id int(10) NOT NULL AUTO_INCREMENT,  
firstname varchar(50),
 lastname varchar(50),
 address varchar(100),
 phonenumber varchar(20),
 email varchar(50),
 dob date,
 isActive bit(1),
 isAvailable bit(1),
 isTrainingCompleted bit(1),
 PRIMARY KEY (mentor_id)    
);

ALTER TABLE mentor_data AUTO_INCREMENT = 1000;

ALTER TABLE mentor_data add column trainingPhases tinyint default 0;

-- Mentee Data
CREATE TABLE mentee_data    
(mentee_id int(10) NOT NULL AUTO_INCREMENT,  
firstname varchar(50),
 lastname varchar(50), 
 phonenumber varchar(20),
 email varchar(50),
 dob varchar(20),
 isActive bit(1),
 isAvailable bit(1),
 PRIMARY KEY (mentee_id)    
);

ALTER TABLE mentee_data AUTO_INCREMENT = 1000;

-- Associations

CREATE TABLE mentor_mentee_assoc    
(mentor_id int(10) NOT NULL REFERENCES mentor_data(mentor_id),
 mentee_id int(10) NOT NULL REFERENCES mentee_data(mentee_id), 
 match_date date,
 expiry_date date,
 PRIMARY KEY (mentor_id, mentee_id)    
);

-- Activity Summary
CREATE TABLE activity_summary    
(activity_id int(10) NOT NULL AUTO_INCREMENT,  
 mentor_id int(10) NOT NULL REFERENCES mentor_data(mentor_id),
 mentee_id int(10) NOT NULL REFERENCES mentee_data(mentee_id), 
 submission_date date,
 callAttended bit(1),
 PRIMARY KEY (activity_id)    
);

-- Activity List

CREATE TABLE activity_list  
(activity_id int(10) NOT NULL,
activity_type varchar(50),
isKept bit(1),
duration varchar(10),
comments mediumtext
);

alter table mentee_data modify column dob date;

desc mentee_data;

commit;

-- Changes to mentee_data and mentor_data Tables

ALTER TABLE mentee_data ADD COLUMN age INT AFTER lastname;
ALTER TABLE mentee_data ADD COLUMN city VARCHAR(100) AFTER email;

ALTER TABLE mentor_data ADD COLUMN date DATETIME NOT NULL AFTER lastname;
ALTER TABLE mentor_data CHANGE address street_address VARCHAR(150);
ALTER TABLE mentor_data CHANGE phonenumber phone VARCHAR(20);
ALTER TABLE mentor_data ADD COLUMN phonenumber_alter VARCHAR(20) AFTER phonenumber;
ALTER TABLE mentor_data ADD COLUMN pref_contact VARCHAR(10) AFTER dob;
ALTER TABLE mentor_data ADD COLUMN recent_employer VARCHAR(100) AFTER pref_contact;
ALTER TABLE mentor_data ADD COLUMN recent_position VARCHAR(100) AFTER recent_employer;
ALTER TABLE mentor_data ADD COLUMN languages VARCHAR(100) AFTER recent_position;
