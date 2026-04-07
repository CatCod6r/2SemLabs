# Загальне завдання (Нульовий варіант): Пошук та заміна чисел
import re

def main():
    # Вхідний текст
    text = "У цьому рядку є числа: 123, 45 і 6789."
    
    # Пошук всіх чисел у тексті
    # \d+ означає "одна або більше цифр"
    numbers_found = re.findall(r'\d+', text)
    print("Знайдені числа:", numbers_found)
    
    # Замінюємо всі числа на символ #
    # re.sub(pattern, repl, string)
    text_modified = re.sub(r'\d+', '#', text)
    print("Рядок після заміни чисел:", text_modified)

if __name__ == "__main__":
    main()
