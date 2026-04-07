# Загальне завдання (Нульовий варіант): Читання, обробка та запис
import os

# Перевірка наявності вхідного файлу
if not os.path.exists('input.txt'):
    print("Файл input.txt не знайдено. Створіть файл та додайте дані.")
else:
    # Відкриваємо файл для читання у кодуванні UTF-8
    with open('input.txt', 'r', encoding='utf-8') as infile:
        lines = infile.readlines() # Зчитуємо всі рядки у список
        
    # Обробка рядків: переводимо в нижній регістр та видаляємо порожні рядки
    processed_lines = [line.lower() for line in lines if line.strip() != '']
    
    # Відкриваємо новий файл для запису результату
    with open('output.txt', 'w', encoding='utf-8') as outfile:
        outfile.writelines(processed_lines) # Записуємо оброблені рядки
        
    print("Обробка файлу завершена. Результат збережено у 'output.txt'.")
