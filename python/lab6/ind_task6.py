# Індивідуальне завдання (Варіант 10): Порівняння JSON файлів
import json

FILE_1_TO_CMP = "file1.json"
FILE_2_TO_CMP = "file2.json"

def parse_file_to_json(filename):
    """
    Функція для зчитування JSON-файлу у словник Python.
    """
    with open(filename, "r", encoding="utf-8") as file:
        parsed_json = json.load(file)
    return parsed_json

def main():
    # Парсимо обидва файли
    file1 = parse_file_to_json(FILE_1_TO_CMP)
    file2 = parse_file_to_json(FILE_2_TO_CMP)
    
    # Визначаємо, який файл більший за кількістю ключів першого рівня
    biggest_file = file1 if len(file1) > len(file2) else file2
    smallest_file = file2 if len(file1) > len(file2) else file1
    
    # Порівнюємо значення за ключами
    for key, value in biggest_file.items():
        if value != smallest_file.get(key):
            print(f"Difference in key '{key}':\n  File A: {value}\n  File B: {smallest_file.get(key)}\n")

if __name__ == "__main__":
    main()
