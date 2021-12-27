#!/usr/bin/env python3
from utils import read_file
from Day3Part1 import calculate_power_consumption


def run_tests():
    garbage_input = read_file("garbageInput.txt")
    sample_input = read_file("sampleInput.txt")
    assert(calculate_power_consumption(garbage_input) == 0)
    assert(calculate_power_consumption(sample_input) == 198)
    assert(calculate_power_consumption([]) == 0)


def main():
    run_tests()


if __name__ == "__main__":
	main()