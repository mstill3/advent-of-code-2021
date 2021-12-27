#!/usr/bin/env python3

def read_file(file_name: str) -> list[str]:
    """ Reads content of file """
    with open(file_name) as f:
        return f.read().splitlines()


def binary_to_decimal(binary: str) -> int:
    """ Converts binary number to decimal """
    return int(binary, 2)


def decimal_to_binary(decimal: int) -> str:
    """ Converts decimal number to binary """
    return bin(decimal).replace("0b","")
