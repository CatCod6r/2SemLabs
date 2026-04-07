# Індивідуальне завдання (Варіант 10): Перевірка формату дати dd-mm-yyyy
import logging
from datetime import datetime

# Налаштування логування для індивідуального завдання
logging.basicConfig(filename='date_error.log', level=logging.ERROR, 
                    format='%(asctime)s - %(levelname)s - %(message)s', encoding='utf-8')

def validate_date(date_string):
    """
    Функція перевіряє коректність дати. 
    У разі помилки викликається виняток ValueError, який ми перехоплюємо.
    """
    try:
        # datetime.strptime автоматично перевіряє і формат, і існуючі дні в місяці
        valid_date = datetime.strptime(date_string, "%d-%m-%Y")
    except ValueError as e:
        msg = f"Помилка: Дата '{date_string}' має некоректний формат або не існує."
        print(msg)
        # Запис винятку у логфайл
        logging.error(f"{msg} Деталі: {e}")
    else:
        print(f"Успіх: Дата '{valid_date.strftime('%d-%m-%Y')}' введена правильно!")
    finally:
        print("-" * 30)

def main():
    # Тестові значення для перевірки
    test_dates = [
        "15-05-2026",   # Правильна дата
        "32-01-2026",   # Неправильний день (32 січня)
        "12/05/2026",   # Неправильний роздільник (/)
        "qwerty"        # Взагалі не дата
    ]
    
    for date_str in test_dates:
        print(f"Перевіряємо значення: {date_str}")
        validate_date(date_str)

if __name__ == "__main__":
    main()
