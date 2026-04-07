# Загальне завдання (Нульовий варіант): Ділення двох чисел із записом у логфайл
import logging

# Налаштування логування: помилки записуватимуться у файл error.log
logging.basicConfig(filename='error.log', level=logging.ERROR, 
                    format='%(asctime)s - %(levelname)s - %(message)s', encoding='utf-8')

try:
    # Введення даних користувачем
    a = float(input("Введіть перше число: "))
    b = float(input("Введіть друге число: "))
    
    # Спроба виконати ділення
    result = a / b
except ValueError as e:
    # Обробка помилки некоректного введення
    msg = "Помилка: введено некоректні дані. Необхідно вводити числа."
    print(msg)
    logging.error(f"{msg} Деталі: {e}")
except ZeroDivisionError as e:
    # Обробка помилки ділення на нуль
    msg = "Помилка: ділення на нуль неможливе."
    print(msg)
    logging.error(f"{msg} Деталі: {e}")
else:
    # Виконується, якщо винятків не виникло
    print(f"Результат ділення: {result}")
finally:
    # Виконується завжди
    print("Програма 'zagal_task7' завершила виконання.")
