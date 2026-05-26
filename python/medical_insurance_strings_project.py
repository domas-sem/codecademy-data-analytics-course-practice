medical_data = \
"""Marina Allison   ,27   ,   31.1 , 
#7010.0   ;Markus Valdez   ,   30, 
22.4,   #4050.0 ;Connie Ballard ,43 
,   25.3 , #12060.0 ;Darnell Weber   
,   35   , 20.6   , #7500.0;
Sylvie Charles   ,22, 22.1 
,#3022.0   ;   Vinay Padilla,24,   
26.9 ,#4620.0 ;Meredith Santiago, 51   , 
29.3 ,#16330.0;   Andre Mccarty, 
19,22.7 , #2900.0 ; 
Lorena Hodson ,65, 33.1 , #19370.0; 
Isaac Vu ,34, 24.8,   #7045.0"""

# Add your code here
#1 Print medical_data to see the output in the terminal

print(medical_data)
#2
# We want the insurance costs to be represented in US dollars.Replace all instances of # in medical_data with $. Store the result in a variable called updated_medical_data.Print updated_medical_data.

updated_medical_data = medical_data.replace("#", "$")
print(updated_medical_data)
#3,4
# We want to calculate the number of medical records in our data.Create a variable called num_records and initialize it at 0.
# Next, write a for loop to iterate through the updated_medical_data string. Inside of the loop, add 1 to num_records when the current character is equal to $.

num_records = 0
for character in updated_medical_data:
  if character == "$":
    num_records += 1 
#5
# Outside of the loop, print num_records with the following message:
# There are {num_records} medical records in the data.

print("There are " + str(num_records) + " medical records in the data.")

#6
# The medical data in its current form is difficult to analyze. An essential job for a data scientist is to clean up data so that it’s easy to work with.Let’s start off by splitting the updated_medical_data string into a list of each medical record. Remember that each medical record is separated by a ; in the string.Store the result in a variable called medical_data_split and print this variable.


medical_data_split = updated_medical_data.split(";")
print(medical_data_split)
#7 
# Our data is now stored in a list, but it is still hard to read. Let’s split each medical record into its own list.First, define an empty list called medical_records.

medical_records = []
#8
# Next, iterate through medical_data_split and for each record, split the string after each comma (,) and append the split string to medical_records.Print medical_records after the loop.

for record in medical_data_split:
  medical_records.append(record.split(','))
print(medical_records)
#9
# Our data is now slightly more readable. However, it is not properly formatted – it contains unnecessary whitespace.To fix this, let’s start by creating an empty list called medical_records_clean.

medical_records_clean = []
#10-13
# Next, use a for loop to iterate through medical_records.Inside of the loop, create an empty list called record_clean. We’ll use this list to store a formatted version of each medical record.
# After the record_clean variable, create a nested for loop that goes through each record
# Finally, we need to add each cleaned up record to medical_records_clean.
# Print medical_records_clean outside of the for loops to see the output.

medical_records_clean = []
# outside loop that goes through each record in medical_records
for record in medical_records:
  # empty list that will store each cleaned record
  record_clean = []
  # nested loop to go through each item in each medical record
  for item in record:
    # cleaning the whitespace for each record using item.strip()
    record_clean.append(item.strip())
  # add the cleaned medical record to the medical_records_clean list
  medical_records_clean.append(record_clean)
print(medical_records_clean)
#14
#for record in medical_records_clean:
#print(record[0])
#15
# You want all of the names in the medical records to be in uppercase characters.In the for loop, update record[0] before the print statement so that all of the characters are uppercase.

for record in medical_records_clean:
  record[0] = record[0].upper()
print(record[0])
#16
# Let’s store each name, age, BMI, and insurance cost in separate lists.To start, create four empty lists:names,ages,bmis,insurance_costs

names = []
ages = []
bmis = []
insurance_costs = []
#17
# Next, iterate through medical_records_clean and for each record
for record in medical_records_clean:
  # append the name, age, BMI, and insurance cost from the current medical record 
  names.append(record[0])
  ages.append(record[1])
  bmis.append(record[2])
  insurance_costs.append(record[3])
#18
print("Names: " + str(names))
print("Ages: " + str(ages))
print("BMI: "  + str(bmis))
print("Insurance Costs: " + str(insurance_costs))
#19
# Now that all of our data is in separate lists, we can easily perform analysis on that data. Let’s calculate the average BMI in our dataset.
total_bmi = 0
#20
# Next, use a for loop to iterate through bmis and add each bmi to total_bmi.Remember to convert bmi to a float.

for bmi in bmis:
  total_bmi += float(bmi)
#21 
# After the for loop, create a variable called average_bmi that stores the total_bmi divided by the length of the bmis list

average_bmi = total_bmi/len(bmis)
print("Average BMI: " + str(average_bmi))
