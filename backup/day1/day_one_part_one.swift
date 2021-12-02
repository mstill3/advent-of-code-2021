#!/usr/bin/swift
import ArgumentParser


func countLargerThanPrevious(nums: [Int]) -> Int{
    var bigger = 0
    for (index, num) in nums.enumerated() {
        if index > 0 && num > nums[index-1] {
            bigger += 1
        }
    }
    return bigger
}


@main
struct Main: ParsableCommand {
    // @Flag(help: "Include a counter with each repetition.")
    // var includeCounter = false

    // @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    // var count: Int?

    // @Argument(help: "The phrase to repeat.")
    // var phrase: String

    mutating func run() throws {
        // let repeatCount = count ?? .max

        // for i in 1...repeatCount {
        //     if includeCounter {
        //         print("\(i): \(phrase)")
        //     } else {
        //         print(phrase)
        //     }
        // }

        let input = []  //read and parse input
        let answer = countLargerThanPrevious(nums: sampleInput)
        print(answer)
    }
}