# Загальне завдання (Нульовий варіант): Робота з JSON
import json
import os

def main():
    # Перевіряємо чи існує файл
    if not os.path.exists("students.json"):
        print("Файл students.json не знайдено!")
        return

    # 1. Зчитування даних з JSON-файлу
    with open("students.json", "r", encoding="utf-8") as file:
        students = json.load(file) # JSON перетворюється на список словників

    # 2. Вивід даних на екран
    print("Поточний список студентів:")
    for student in students:
        print(f"{student['name']}, вік: {student['age']}, факультет: {student['faculty']}")

    # 3. Додавання нового студента
    new_student = {
        "name": "Назар",
        "age": 19,
        "faculty": "ІОТ"
    }
    students.append(new_student)

    # 4. Запис оновлених даних у новий файл
    with open("students_updated.json", "w", encoding="utf-8") as file:
        json.dump(students, file, ensure_ascii=False, indent=4)

    print("\nНовий студент доданий. Дані збережено у файлі 'students_updated.json'.")

if __name__ == "__main__":
    main()
