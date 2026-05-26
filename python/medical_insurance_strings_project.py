"""
Medical insurance string cleaning practice project.

This script demonstrates how to:
- clean a raw text dataset
- replace characters in strings
- split records into structured lists
- remove unnecessary whitespace
- transform names to uppercase
- separate values into individual lists
- calculate the average BMI
"""

medical_data = """
Marina Allison   ,27   ,   31.1 , #7010.0   ;
Markus Valdez   ,   30, 22.4,   #4050.0 ;
Connie Ballard ,43 ,   25.3 , #12060.0 ;
Darnell Weber   ,   35   , 20.6   , #7500.0;
Sylvie Charles   ,22, 22.1 ,#3022.0   ;
Vinay Padilla,24,   26.9 ,#4620.0 ;
Meredith Santiago, 51   , 29.3 ,#16330.0;
Andre Mccarty, 19,22.7 , #2900.0 ;
Lorena Hodson ,65, 33.1 , #19370.0;
Isaac Vu ,34, 24.8,   #7045.0
"""

# Replace # with $ to format insurance costs as currency
updated_medical_data = medical_data.replace("#", "$")

# Count how many medical records exist in the dataset
num_records = 0
for character in updated_medical_data:
    if character == "$":
        num_records += 1

print(f"There are {num_records} medical records in the data.")

# Split the raw string into separate medical records
medical_data_split = updated_medical_data.split(";")

# Remove empty records and split each record into fields
medical_records = []
for record in medical_data_split:
    if record.strip():
        medical_records.append(record.split(","))

# Clean whitespace from each field
medical_records_clean = []

for record in medical_records:
    clean_record = []
    for item in record:
        clean_record.append(item.strip())
    medical_records_clean.append(clean_record)

# Convert all names to uppercase
for record in medical_records_clean:
    record[0] = record[0].upper()

# Create separate lists for each field
names = []
ages = []
bmis = []
insurance_costs = []

for record in medical_records_clean:
    names.append(record[0])
    ages.append(record[1])
    bmis.append(record[2])
    insurance_costs.append(record[3])

# Print cleaned lists
print(f"Names: {names}")
print(f"Ages: {ages}")
print(f"BMIs: {bmis}")
print(f"Insurance costs: {insurance_costs}")

# Calculate average BMI
total_bmi = 0

for bmi in bmis:
    total_bmi += float(bmi)

average_bmi = total_bmi / len(bmis)

print(f"Average BMI: {average_bmi:.2f}")
