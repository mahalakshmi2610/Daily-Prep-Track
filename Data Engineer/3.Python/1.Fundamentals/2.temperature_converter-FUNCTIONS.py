def celsius_to_fahrenheit(celsius):
    return (celsius * 9/5) + 32
def fahrenheit_to_celsius(fahrenheit):
    return (fahrenheit - 32) * 5/9

choice = input("Convert from (C)elsius or (F)ahrenheit? ").strip().upper()

if choice == 'C':
    c = float(input("Enter temperature in Celsius: "))
    f = celsius_to_fahrenheit(c)
    print(f"{c}°C is {f:.2f}°F")
elif choice == 'F':
    f = float(input("Enter temperature in Fahrenheit: "))
    c = fahrenheit_to_celsius(f)
    print(f"{f}°F is {c:.2f}°C")
else:
    print("Invalid input. Please choose 'C' or 'F'.")
