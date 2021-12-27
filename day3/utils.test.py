#!/usr/bin/env python3

from utils import read_file, binary_to_decimal, decimal_to_binary


def test_read_file():
    assert(read_file("garbageInput.txt") == ["0000", "0000", "0000"])
	# print(read_file("dsds"))


def test_binary_to_decimal():
    assert(binary_to_decimal("0") == 0)
    assert(binary_to_decimal("1") == 1)
    assert(binary_to_decimal("10") == 2)
    assert(binary_to_decimal("11") == 3)
    assert(binary_to_decimal("100") == 4)
    assert(binary_to_decimal("1010") == 10)


def test_decimal_to_binary():
    assert(decimal_to_binary(0) == "0")
    assert(decimal_to_binary(1) == "1")
    assert(decimal_to_binary(2) == "10")
    assert(decimal_to_binary(3) == "11")
    assert(decimal_to_binary(4) == "100")
    assert(decimal_to_binary(10) == "1010")


def main():
    test_read_file()
    test_binary_to_decimal()
    test_decimal_to_binary()


if __name__ == "__main__":
	main()