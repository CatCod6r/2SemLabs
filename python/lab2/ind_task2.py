first_member = int(input("Введіть перший член геометричної прогресії: "))
znamennik = int(input("Введіть знаменник: "))
number_of_members = int(input("Введіть кількість членів гкометричної прогресії: "))

current_sum = 0
for i in range(number_of_members):
    if i == number_of_members:
        break
    elif i == 0:
        current_sum = first_member
        print(current_sum)
        continue
    current_sum *= znamennik
    print(current_sum)
