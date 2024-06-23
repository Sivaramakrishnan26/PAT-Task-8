-- Create a DB
CREATE DATABASE IMDB;  

-- Use the Created DB
USE IMDB;  

-- Create a Table Movie with the below Columns
CREATE TABLE Movie  
(
MovieID INT AUTO_INCREMENT PRIMARY KEY,  -- Column MovieID as Primary Key with Unique Identifier (Auto Incremented Integer)
Title VARCHAR(255),
ReleaseYear INT,
Language VARCHAR(255) CHECK(Language IN ("Tamil", "Malayalam", "Telugu", "Hindi", "English"))  -- Column Language should have the mentioned values only as a language
);

-- Create a Table Media with the below Columns
CREATE TABLE Media  
(
MediaID INT AUTO_INCREMENT PRIMARY KEY,  -- Column MediaID as Primary Key with Unique Identifier (Auto Incremented Integer)
MediaName VARCHAR(255),
MovieID INT,
FOREIGN KEY (MovieID) REFERENCES movie(MovieID),  -- Referencing Movie table with the primary key of the Movie table
MediaType VARCHAR(6) NOT NULL CHECK (MediaType IN ("Video", "Image"))  -- Column MediaType should have the mentioned values only and it should not be null
);

-- Create a Table Genre with the below Columns
CREATE TABLE Genre
(
GenreID INT AUTO_INCREMENT PRIMARY KEY,  -- Column GenreID as Primary Key with Unique Identifier (Auto Incremented Integer)
GenreName VARCHAR(255) NOT NULL CHECK (GenreName IN 
	("Action", "Comedy", "Romance", "RomCom", "Horror", "Thriller", "SciFi", "Fantasy", "Drama"))  -- Column GenreName should have the mentioned values only as a Genre
);

-- Create a Table Users with the below Columns
CREATE TABLE Users
(
UserID INT AUTO_INCREMENT PRIMARY KEY,  -- Column UserID as Primary Key with Unique Identifier (Auto Incremented Integer)
UserName VARCHAR(255),
UserEmail VARCHAR(255) CHECK 
	(UserEmail REGEXP "^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$")  -- Using Regex to check whether the given Email address is valid or not
);

-- Create a Table Review with the below Columns
CREATE TABLE Review
(
ReviewID INT AUTO_INCREMENT PRIMARY KEY,  -- Column ReviewID as Primary Key with Unique Identifier (Auto Incremented Integer)
MovieID INT,
FOREIGN KEY (MovieID) REFERENCES movie(MovieID),  -- Referencing Movie table with the primary key of the Movie table
UserID INT,
FOREIGN KEY (UserID) REFERENCES Users(UserID),  -- Referencing Users table with the primary key of the Users table
Review VARCHAR(255) CHECK (Review IN ("Good", "Average", "Bad"))
);

-- Create a Table Artist with the below Columns
CREATE TABLE Artist
(
ArtistID INT AUTO_INCREMENT PRIMARY KEY,  -- Column ArtistID as Primary Key with Unique Identifier (Auto Incremented Integer)
MovieID INT,
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),  -- Referencing Movie table with the primary key of the Movie table
ArtistName VARCHAR(255),
DOB DATE
);

-- Create a Table Roles with the below Columns
CREATE TABLE Roles
(
RoleID INT AUTO_INCREMENT PRIMARY KEY,  -- Column RoleID as Primary Key with Unique Identifier (Auto Incremented Integer)
ArtistID INT,
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),  -- Referencing Artist table with the primary key of the Artist table
MovieID INT,
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),  -- Referencing Movie table with the primary key of the Movie table
CharacterName VARCHAR(255),
RoleType VARCHAR(255) CHECK (RoleType IN
	("Director", "Producer", "Cinematographer", "Assistant Director", "Male Artist", "Female Artist"))  -- Column RoleType should have the mentioned values only as a Role
);
