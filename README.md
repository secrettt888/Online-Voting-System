# 🗳️ Online Voting System Database

This repository contains a full MySQL database dump for an online voting system. It includes a complete relational schema, populated sample data, automated triggers, and a unified view for analyzing voting choices.

## 📊 Database Schema

The database consists of the following core tables:
* **`voters`**: Stores voter IDs and names.
* **`candidates`**: Stores candidate profiles, including age and platform descriptions.
* **`elections`**: Stores different election events (e.g., Presidential, Mayoral, Student Union).
* **`participation`**: A mapping table linking candidates to the specific elections they are running in.
* **`ballots`**: The core voting record linking a voter, an election, and their chosen candidate.
* **`results`**: A tally table that tracks the total number of votes for each candidate in an election.

## ⚙️ Key Features & Triggers

The database uses several MySQL triggers to automate voting logic and maintain data integrity:
* **`vote_proccess`**: Automatically increments the vote count in the `results` table whenever a new ballot is inserted.
* **`check_for_correction`**: Validates ballots *before* they are cast, ensuring a voter can only vote for a candidate who is actually participating in that specific election.
* **`inseration`**: Automatically initializes a candidate's vote tally in the `results` table when they are added to the `participation` table.
* **Cascading Deletions**: Triggers like `in_case_deletion` and `delete_candidate_election` ensure that if a voter or election is deleted, their associated ballots are safely removed.

## 🔍 Views
* **`VOTER_CHOICES`**: A pre-built SQL View that joins multiple tables to display a clean, human-readable record of who voted for whom, the election name, and the candidate's details.

## 🚀 How to Use
1. Clone this repository or download the `Online_voting_sys.sql` file.
2. Import the file into your MySQL environment using a tool like MySQL Workbench, phpMyAdmin, or the command line:
   ```bash
   mysql -u username -p database_name < Online_voting_sys.sql
