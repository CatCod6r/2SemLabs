# or just use list(set(my_list))

my_list = [10, 10, 20, 30, 10, 40, 50]

print(my_list)

unique_list = []
for item in my_list:
    if item not in unique_list:
        unique_list.append(item)

print(unique_list)
