# Загальне завдання (Нульовий варіант): Клас Student
class Student:
    # Конструктор класу (метод ініціалізації об'єкта)
    def __init__(self, first_name, last_name, age):
        # Атрибути класу
        self.first_name = first_name   # ім'я студента
        self.last_name = last_name     # прізвище студента
        self.age = age                 # вік студента

    # Метод для виведення інформації про студента
    def show_info(self):
        print("Ім'я:", self.first_name)
        print("Прізвище:", self.last_name)
        print("Вік:", self.age)

def main():
    # Введення початкових даних
    fname = input("Введіть ім'я студента: ")
    lname = input("Введіть прізвище студента: ")
    age = int(input("Введіть вік студента: "))

    print("\n--- Результат ---")
    # Створення об'єкта класу Student
    student1 = Student(fname, lname, age)
    # Виклик методу класу для виведення інформації
    student1.show_info()

if __name__ == "__main__":
    main()
