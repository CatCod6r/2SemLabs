# Індивідуальне завдання (Варіант 10): Підрахунок голосних літер

# Рядок з голосними літерами (англійська абетка)
LOUD_LITERALS_STRING = "aeiouy"

def does_string_contain_loud_symbols(string):
    """
    Функція приймає рядок та повертає кількість голосних літер у ньому.
    """
    counter = 0
    # Переводимо рядок у нижній регістр для коректного порівняння
    for literal in string.lower():
        # Перевіряємо, чи є символ голосною літерою
        if literal in LOUD_LITERALS_STRING: 
            counter += 1
            
    return counter

def main():
    test_case_number = 0
    # Словник з тестовими випадками: ключ - рядок, значення - очікувана кількість
    test_cases = {
        "abcdefesdfsEDFFEDFlkj": 5,
        "HELLO world": 3,
        "BCDFG": 0,
        "aeiouy": 6,
        "": 0,
        "123!@#": 0,
        "YyYy": 4,
    }
    
    # Проходимо по всіх тестових випадках
    for key, value in test_cases.items():
        test_case_number += 1
        result = does_string_contain_loud_symbols(key)
        
        if result == value:
            print(f"Test case number: {test_case_number} passed succesfully")
        else:
            print(f"Test case: {test_case_number} failed. Expected {value} got {result}")

if __name__ == "__main__":
    main()
