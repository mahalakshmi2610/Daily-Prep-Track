numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
squares = list(map(lambda x: x**2, numbers))

print(type(numbers), numbers)
print(type(squares), squares)

evens = list(filter(lambda x: x % 2 == 0, numbers))
print(type(evens), evens)

odds = list(filter(lambda x: x % 2 == 1, numbers))
print(type(odds), odds)

# square only the even numbers
even_squares = list(map(lambda x: x**2, filter(lambda x: x % 2 == 0, numbers)))
print(even_squares)

# square only the odd numbers
odd_squares = list(map(lambda x: x**2, filter(lambda x: x % 2 ==1, numbers)))
print(odd_squares)