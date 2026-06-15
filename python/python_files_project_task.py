"""
Hacking The Fender - Python file I/O practice project.

This script:
- Reads a CSV file of compromised usernames and passwords using csv.DictReader.
- Collects all compromised usernames into a Python list.
- Writes the compromised usernames to a text file, one per line.
- Creates a JSON file with a status message for a fictional boss.
- Writes an ASCII-art hacker signature to a new CSV file to simulate scrambling passwords.

The project is based on a Codecademy exercise and focuses on practising file handling
with CSV, TXT, and JSON files using Python context managers.
"""

import csv
import json

# Task 2: list to store compromised usernames
compromised_users = []

# Tasks 3–6: read usernames from passwords.csv
with open("passwords.csv") as password_file:
    password_csv = csv.DictReader(password_file)
    for password_row in password_csv:
        compromised_users.append(password_row["Username"])

# Tasks 7–10: write compromised usernames to compromised_users.txt
with open("compromised_users.txt", "w") as compromised_user_file:
    for user in compromised_users:
        compromised_user_file.write(user + "\n")

# Tasks 12–15: notify the boss via JSON
with open("boss_message.json", "w") as boss_message:
    boss_message_dict = {
        "recipient": "The Boss",
        "message": "Mission Success"
    }
    json.dump(boss_message_dict, boss_message)

# Tasks 16–19: scramble passwords with Slash Null's signature
with open("new_passwords.csv", "w") as new_passwords_obj:
    slash_null_sig = """ _  _     ___   __  ____        
/ )( \   / __) /  \(_  _)       
) \/ (  ( (_ \(  O ) )(         
\____/   \___/ \__/ (__)        
 _  _   __    ___  __ _  ____  ____  
/ )( \ / _\  / __)(  / )(  __)(    \ 
) __ (/    \( (__  )  (  ) _)  ) D ( 
\_)(_/\_/\_/ \___)(__\_)(____)(____/ 
        ____  __     __   ____  _  _ 
 ___   / ___)(  )   / _\ / ___)/ )( \
(___)  \___ \/ (_/\/    \\___ \) __ (
       (____/\____/\_/\_/(____/\_)(_/
 __ _  _  _  __    __               
(  ( \/ )( \(  )  (  )              
/    /) \/ (/ (_/\/ (_/\            
\_)__)\____/\____/\____/"""
    new_passwords_obj.write(slash_null_sig)