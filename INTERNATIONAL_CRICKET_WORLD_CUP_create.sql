-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-13 10:47:34.3

-- tables
-- Table: Match
CREATE TABLE `Match` (
    match_id varchar(30)  NOT NULL,
    Team1 varchar(70)  NOT NULL,
    Team2 varchar(80)  NOT NULL,
    Winner varchar(60)  NOT NULL,
    Run_score int  NOT NULL,
    coach_id varchar(30)  NOT NULL,
    CONSTRAINT Match_pk PRIMARY KEY (match_id)
);

-- Table: Players
CREATE TABLE Players (
    player_id varchar(30)  NOT NULL,
    player_name varchar(40)  NOT NULL,
    nationality varchar(60)  NOT NULL,
    Player_type varchar(60)  NOT NULL,
    Team_id varchar(30)  NOT NULL,
    CONSTRAINT Players_pk PRIMARY KEY (player_id)
);

-- Table: Sponsors
CREATE TABLE Sponsors (
    Sponsors_id varchar(30)  NOT NULL,
    Sponsor_name varchar(45)  NOT NULL,
    Total_distributed_amount int  NOT NULL,
    Ticket_id varchar(30)  NOT NULL,
    CONSTRAINT Sponsors_pk PRIMARY KEY (Sponsors_id)
);

-- Table: Stadium
CREATE TABLE Stadium (
    Stadium_id varchar(30)  NOT NULL,
    Stadium_name varchar(50)  NOT NULL,
    location varchar(50)  NOT NULL,
    Sponsors_id varchar(30)  NOT NULL,
    match_id varchar(30)  NOT NULL,
    CONSTRAINT Stadium_pk PRIMARY KEY (Stadium_id)
);

-- Table: Team
CREATE TABLE Team (
    Team_id varchar(30)  NOT NULL,
    Team_name varchar(56)  NOT NULL,
    Total_player int  NOT NULL,
    Team_rank int  NOT NULL,
    CONSTRAINT Team_pk PRIMARY KEY (Team_id)
);

-- Table: Ticket_details
CREATE TABLE Ticket_details (
    Ticket_id varchar(30)  NOT NULL,
    Ticket_type varchar(50)  NOT NULL,
    Qty int  NOT NULL,
    Price int  NOT NULL,
    CONSTRAINT Ticket_details_pk PRIMARY KEY (Ticket_id)
);

-- Table: coach_details
CREATE TABLE coach_details (
    coach_id varchar(30)  NOT NULL,
    Nationality varchar(40)  NOT NULL,
    Name varchar(55)  NOT NULL,
    Team_id varchar(30)  NOT NULL,
    CONSTRAINT coach_details_pk PRIMARY KEY (coach_id)
);

-- Table: umpire
CREATE TABLE umpire (
    umpire_id varchar(30)  NOT NULL,
    umpire_name varchar(54)  NOT NULL,
    nationality varchar(45)  NOT NULL,
    umpire_rank int  NOT NULL,
    match_id varchar(30)  NOT NULL,
    CONSTRAINT umpire_pk PRIMARY KEY (umpire_id)
);

-- foreign keys
-- Reference: Match_coach_details (table: Match)
ALTER TABLE `Match` ADD CONSTRAINT Match_coach_details FOREIGN KEY Match_coach_details (coach_id)
    REFERENCES coach_details (coach_id);

-- Reference: Players_Team (table: Players)
ALTER TABLE Players ADD CONSTRAINT Players_Team FOREIGN KEY Players_Team (Team_id)
    REFERENCES Team (Team_id);

-- Reference: Sponsors_Ticket_details (table: Sponsors)
ALTER TABLE Sponsors ADD CONSTRAINT Sponsors_Ticket_details FOREIGN KEY Sponsors_Ticket_details (Ticket_id)
    REFERENCES Ticket_details (Ticket_id);

-- Reference: Stadium_Match (table: Stadium)
ALTER TABLE Stadium ADD CONSTRAINT Stadium_Match FOREIGN KEY Stadium_Match (match_id)
    REFERENCES `Match` (match_id);

-- Reference: Stadium_Sponsors (table: Stadium)
ALTER TABLE Stadium ADD CONSTRAINT Stadium_Sponsors FOREIGN KEY Stadium_Sponsors (Sponsors_id)
    REFERENCES Sponsors (Sponsors_id);

-- Reference: coach_details_Team (table: coach_details)
ALTER TABLE coach_details ADD CONSTRAINT coach_details_Team FOREIGN KEY coach_details_Team (Team_id)
    REFERENCES Team (Team_id);

-- Reference: umpire_Match (table: umpire)
ALTER TABLE umpire ADD CONSTRAINT umpire_Match FOREIGN KEY umpire_Match (match_id)
    REFERENCES `Match` (match_id);

-- End of file.

