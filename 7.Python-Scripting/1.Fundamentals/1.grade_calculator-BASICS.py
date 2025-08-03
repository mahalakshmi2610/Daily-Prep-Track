while True:

    print("Enter your marks below for each subjects mentioned out of 100:")
    english = int(input("English: "))
    tamil = int(input("Tamil: "))
    maths = int(input("Maths: "))
    science = int(input("Science: "))
    social_science = int(input("Social Science: "))

    total = english + tamil + maths + science + social_science

    average = total / 5

    if average >= 90:
        grade = 'A'
    elif average >= 80:
        grade = 'B'
    elif average >= 70:
        grade = 'C'
    elif average >= 60:
        grade = 'D'
    else:
        grade = 'F'

    print(f"Total: {total}, Average: {average}, Grade: {grade}")

    again = input("Calculate again? (yes/no): ")

    if again.lower() != 'yes':
        break