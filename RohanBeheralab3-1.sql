--Relational Model for University
DROP TABLE IF EXISTS Professor, Dept, Project, Graduate, Work_Proj, Work_Dept, Work_In, Supervise, Advise, Major, Manage, 
Runs, Musicians, Instrument, Album, Songs, Place, Telephone, Plays, Perform, Lives, Appears, Producer;


CREATE TABLE Professor (
	ssn CHAR(11) NOT NULL,
	name CHAR(50),
	age INT,
	rank CHAR(5),
	specialty CHAR(50),
	PRIMARY KEY(ssn)
);

CREATE TABLE Dept (
	dno INT,
	dname CHAR(50),
	office CHAR(50),
	ssn CHAR(11) NOT NULL,
	PRIMARY KEY(dno),
	foreign key(ssn) references Professor
);

CREATE TABLE Project (
	pno INT,
	sponsor CHAR(50),
	start_date DATE,
	end_date DATE,
	budget MONEY,
	ssn CHAR(11) NOT NULL,
	PRIMARY KEY(pno),
	FOREIGN KEY(ssn) REFERENCES Professor
);

CREATE TABLE Graduate (
	ssn CHAR(11) NOT NULL,
	name CHAR(50),
	age INT,
	deg_pg CHAR(50),
	dno INT NOT NULL,
	PRIMARY KEY(ssn),
	FOREIGN KEY(dno) REFERENCES Dept 
);

CREATE TABLE Work_Proj (
	work_projID INT NOT NULL,
	since DATE,
	pno INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	PRIMARY KEY(ssn, pno),
	FOREIGN KEY(pno) REFERENCES Project,
	FOREIGN KEY(ssn) REFERENCES Graduate
);

CREATE TABLE Work_Dept (
	work_deptID INT NOT NULL,
	dno INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	time_pc DECIMAL,
	PRIMARY KEY(dno, ssn),
	FOREIGN KEY(dno) REFERENCES Dept,
	FOREIGN KEY(ssn) REFERENCES Professor
);

CREATE TABLE Work_In (
	work_inID INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	pno INT,
	PRIMARY KEY(ssn, pno),
	FOREIGN KEY(ssn) REFERENCES Professor,
	FOREIGN KEY(pno) REFERENCES Project
);

CREATE TABLE Supervise (
	superviseID INT NOT NULL,
	pno INT NOT NULL,
	graduate_ssn CHAR(11) NOT NULL,
	professor_ssn CHAR(11) NOT NULL,
	PRIMARY KEY(pno, graduate_ssn, professor_ssn),
	FOREIGN KEY(pno) REFERENCES Project,
	FOREIGN KEY(graduate_ssn) REFERENCES Graduate,
	FOREIGN KEY(professor_ssn) REFERENCES Professor
);

CREATE TABLE Advise (
	adviseID INT NOT NULL,
	graduate_ssn CHAR(11) NOT NULL,
	seniorgrad_ssn CHAR(11) NOT NULL,
	PRIMARY KEY(graduate_ssn, seniorgrad_ssn),
	FOREIGN KEY(graduate_ssn) REFERENCES Graduate,
	FOREIGN KEY(seniorgrad_ssn) REFERENCES Graduate
);

CREATE TABLE Major (
	majorID INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	dno INT NOT NULL,
	PRIMARY KEY(ssn),
	FOREIGN KEY(ssn) REFERENCES Graduate,
	FOREIGN KEY(dno) REFERENCES Dept
);

CREATE TABLE Manage (
	manageID INT NOT NULL,
	pno INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	PRIMARY KEY(pno),
	FOREIGN KEY(pno) REFERENCES Project,
	FOREIGN KEY(ssn) REFERENCES Graduate
);

CREATE TABLE Runs (
	runsID INT NOT NULL,
	dno INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	PRIMARY KEY(dno),
	FOREIGN KEY(dno) REFERENCES Dept,
	FOREIGN KEY(ssn) REFERENCES Graduate
);

--Relational Model for Notown

CREATE TABLE Musicians (
	ssn CHAR(11) NOT NULL,
	name CHAR(50),
	PRIMARY KEY(ssn)
);

CREATE TABLE Instrument (
	instrID CHAR(5) NOT NULL,
	dname CHAR(50),
	key CHAR(50),
	PRIMARY KEY(instrID)
);	

CREATE TABLE Album (
	albumID INT NOT NULL,
	title CHAR(50),
	copyrightDate DATE,
	speed DECIMAL,
	SSN CHAR(11) NOT NULL,
	PRIMARY KEY(albumID),
	FOREIGN KEY(ssn) REFERENCES Musicians
);			

CREATE TABLE Songs (
	songID INT NOT NULL,
	title CHAR(50),
	author CHAR(50),
	albumID Integer NOT NULL,
	PRIMARY KEY(songID),
	FOREIGN KEY(albumID) REFERENCES Album
);		

CREATE TABLE Place (
	placeID INT NOT NULL, 
	address CHAR(100) NOT NULL,
	PRIMARY KEY(address)
);

CREATE TABLE Telephone (
	phone_no CHAR(11) NOT NULL,
	address CHAR(100) NOT NULL,
	PRIMARY KEY(phone_no, address),
	FOREIGN KEY(address) REFERENCES Place
);

CREATE TABLE Plays (
	playsID INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	instrID CHAR(5) NOT NULL,
	PRIMARY KEY(ssn, instrID),
	FOREIGN KEY(ssn) REFERENCES Musicians,
	FOREIGN KEY(instrID) REFERENCES Instrument
);		

CREATE TABLE Perform (
	performID INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	songID INT NOT NULL,
	PRIMARY KEY(ssn, songID),
	FOREIGN KEY(songID) REFERENCES Songs,
	FOREIGN KEY(ssn) REFERENCES Musicians
);

CREATE TABLE Lives (
	livesID SERIAL NOT NULL,
	ssn CHAR(11) NOT NULL,
	address CHAR(100) NOT NULL,
	PRIMARY KEY(ssn, address),
	FOREIGN KEY(ssn) REFERENCES Musicians(ssn),
	FOREIGN KEY(address) REFERENCES Place(address)
);
				
CREATE TABLE Appears (
	appearsID INT NOT NULL,
	albumID INT NOT NULL,
	songID INT NOT NULL,
	PRIMARY KEY(songID),
	FOREIGN KEY(songID) REFERENCES Songs,
	FOREIGN KEY(albumID) REFERENCES Album
);

CREATE TABLE Producer (
	producerID INT NOT NULL,
	ssn CHAR(11) NOT NULL,
	albumID INT NOT NULL,
	PRIMARY KEY(albumID),
	FOREIGN KEY(albumID) REFERENCES Album,
	FOREIGN KEY(ssn) REFERENCES Musicians
);





