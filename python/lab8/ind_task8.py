# Індивідуальне завдання (Варіант 10): Клас для обчислення середнього значення оцінок

class GradesCalculator:
    # Конструктор класу, який ініціалізує список оцінок
    def __init__(self, group_name):
        self.group_name = group_name
        self.grades = [] # Початково список оцінок порожній

    # Метод для додавання нової оцінки
    def add_grade(self, grade):
        if 0 <= grade <= 100:
            self.grades.append(grade)
            print(f"Оцінку {grade} додано.")
        else:
            print("Помилка: Оцінка має бути від 0 до 100.")

    # Метод для обчислення середнього значення
    def calculate_average(self):
        if len(self.grades) == 0:
            return 0
        return sum(self.grades) / len(self.grades)

    # Метод для виведення результатів
    def show_results(self):
        print(f"\n--- Група: {self.group_name} ---")
        print(f"Список оцінок: {self.grades}")
        print(f"Середній бал: {self.calculate_average():.2f}")

def main():
    # Створення об'єкта класу
    calc = GradesCalculator("ІМ-44")

    # Взаємодія через методи об'єкта
    calc.add_grade(95)
    calc.add_grade(82)
    calc.add_grade(78)
    calc.add_grade(105) # Спроба додати некоректну оцінку
    calc.add_grade(90)

    # Виведення результату
    calc.show_results()

if __name__ == "__main__":
    main()
