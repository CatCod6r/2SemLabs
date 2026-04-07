# Загальне завдання (Нульовий варіант)

# Створення списку цілих чисел
numbers = [12, 5, 8, 20, 3, 15]

# Створення словника з іменами та віком
people = {
    "Олег": 18,
    "Анна": 21,
    "Марія": 19,
    "Іван": 23,
    "Петро": 17
}

# Задання граничного значення віку
age_limit = 18

# Пошук максимального елемента у списку
max_number = numbers[0]
for number in numbers:
    if number > max_number:
        max_number = number

# Виведення максимального значення
print("Максимальний елемент списку:", max_number)

# Обчислення середнього віку людей, старших за заданий вік
sum_age = 0
count = 0

for age in people.values():
    if age > age_limit:
        sum_age += age
        count += 1

# Перевірка, щоб уникнути ділення на нуль
if count > 0:
    average_age = sum_age / count
    print("Середній вік осіб старших за", age_limit, "років:", average_age)
else:
    print("Осіб, старших за", age_limit, "років, не знайдено")
