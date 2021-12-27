#!/usr/bin/env python3
from utils import binary_to_decimal, read_file

class Count:
    ones: int = 0
    zeros: int = 0

    def add_one(self):
        self.ones += 1

    def add_zero(self):
        self.zeros += 1


def calculate_power_consumption(input: list[str]) -> int:
    if len(input) == 0:
        return 0
    
    col_freq: list[Count] = []
    num_cols = len(input[0])

    for _ in range(num_cols):
        col_freq.append(Count())

    # Iterate over each line and print the line
    for line in input:
        for col in range(num_cols):
            digit = line[col]
            if digit == "0":
                col_freq[col].add_zero()
            elif digit == "1":
                col_freq[col].add_one()
            

    gamma: str = ""
    epsilon: str = ""

    for col in col_freq:
        if col.zeros > col.ones:
            gamma += "0"
            epsilon += "1"
        else:
            gamma += "1"
            epsilon += "0"

    return binary_to_decimal(gamma) * binary_to_decimal(epsilon)


def main():
    input = read_file("sampleInput2.txt")
    answer = calculate_power_consumption(input)
    print(answer)


if __name__ == "__main__":
	main()