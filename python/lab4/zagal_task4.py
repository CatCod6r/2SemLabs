# Загальне завдання (Нульовий варіант): Обчислення площі кола
import math

def calculate_circle_area(radius):
    """
    Функція обчислює площу кола за заданим радіусом.
    """
    area = math.pi * radius ** 2
    return area

def main():
    # Виклик функції для різних значень
    radiuses = [5, 10, 20]
    for r in radiuses:
        circle_area = calculate_circle_area(r)
        print(f"Площа кола з радіусом {r} дорівнює {circle_area:.2f}")

if __name__ == "__main__":
    main()
