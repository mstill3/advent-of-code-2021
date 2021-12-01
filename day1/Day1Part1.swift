#!/usr/bin/swift

func day1part1(input: [Int]) -> Int{
    print(input)
    var bigger = 0
    for (index, item) in input.enumerated() {
        if index > 0 && item > input[index-1] {
            bigger += 1
        }
    }
    return bigger
}




let sampleInputDay1Part1 = [
    199,
    200,
    208,
    210,
    200,
    207,
    240,
    269,
    260,
    263
]

let answer = day1part1(input: sampleInputDay1Part1)
print(answer)
