import json

FILE_1_TO_CMP = "file1.json"
FILE_2_TO_CMP = "file2.json"


def main():
    file1 = parse_file_to_json(FILE_1_TO_CMP)
    file2 = parse_file_to_json(FILE_2_TO_CMP)
    biggest_file = file1 if len(file1) > len(file2) else file2
    smallest_file = file2 if len(file1) > len(file2) else file1
    for key, value in biggest_file.items():
        if value != smallest_file.get(key):
            print("Difference: ", value, " and ", smallest_file.get(key))


def parse_file_to_json(filename):
    with open(filename, "r", encoding="utf-8") as file:
        parsed_json = json.load(file)
    return parsed_json


if __name__ == "__main__":
    main()
