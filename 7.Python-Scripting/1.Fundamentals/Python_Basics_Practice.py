print("My name is Mahalakshmi and I like Purple colour.")


# Data types - Data types define the kind of value a variable can hold.
age = 21          # int
height = 5.7      # float
name = "Maha"     # str
is_student = False # bool

# Variables - containers for storing data values
x=10
y="hello"
print(x, y)

temp=x  # temp = 10
x=y # x = hello
y=temp # y = 10
print(x, y)

# Operators - special symbols used to perform operations on variables and values
length = 10
breadth = 3
area = length * breadth
print("Area of rectangle:", area)

# Control Structures - Used to make decisions based on conditions
number = 22
if(number==0):
    print("It is a Zero")
elif(number%2==0):
    print(number,"is even")
else:
    print(number,"is odd")

# Loops - for, while - used to execute a block of code repeatedly
for i in range(1, 11):
    print(i, end=" ")

print("")

n=1
while n <= 10:
    print(n, end=" ")
    n += 1

print()

# break and continue
for i in range(1, 11):
    if(i % 2 != 0):
        continue
    print(i, end=" ")

print()

# try-except block - Handles exceptions (errors) during code execution
try:
    x = 10 / 0
except ZeroDivisionError:
    print("Can't divide by zero!")

# try:
#     num = int(input("Enter a integer:"))
#     print("Valid integer:", num)
# except ValueError:
#     print("Invalid number! Enter a whole number")

# Functions - reusable blocks of code.
def square(num):
    return num*num

print(square(3))

import random
print(random.randint(1, 100))