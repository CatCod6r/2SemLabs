LOUD_LITERALS_STRING = "aeiouy"


def does_string_contain_loud_symbols(string):  # i didnt know a better naming
    counter = 0
    for literal in string.lower():
        for loud_literal in LOUD_LITERALS_STRING:
            if loud_literal == literal:
                counter += 1

    return counter


def main():
    test_case_number = 0
    test_cases = {
        "abcdefesdfsEDFFEDFlkj": 5,
        "HELLO world": 3,
        "BCDFG": 0,
        "aeiouy": 6,
        "": 0,
        "123!@#": 0,
        "YyYy": 4,
    }
    for key, value in test_cases.items():
        test_case_number += 1
        if does_string_contain_loud_symbols(key) == value:
            print(f"Test case number: {test_case_number} passed succesfully")
        else:
            print(f"Test case: {test_case_number} failed.Expected {value} got {key}")


if __name__ == "__main__":
    main()
