#!/usr/bin/swift
import Foundation

class Count {
    var ones: Int = 0
    var zeros: Int = 0

    func addOne() {
        ones += 1
    }

    func addZero() {
        zeros += 1
    }
}

func calculatePowerConsumption(_ input: [String]) -> Int {
    if input.count == 0 {
        return 0
    }
    
    var colFreq: [Count] = []
    let numCols = input[0].count

    for _ in 0...numCols-1 {
        colFreq.append(Count())
    }

    // Iterate over each line and print the line
    for line in input {
        // print("\(line)")
        for col in 0...numCols-1 {
            let digit = Array(line)[col]
            // print(digit)
            if digit == "0" {
                colFreq[col].addZero()
            } else if digit == "1" {
                colFreq[col].addOne()
            }
        }
    }

    var gamma: String = ""
    var epsilon: String = ""

    for col in colFreq {
        if col.zeros > col.ones {
            gamma += "0"
            epsilon += "1"
        } else {
            gamma += "1"
            epsilon += "0"
        }
    }

    return binary2decimal(gamma) * binary2decimal(epsilon)
}

func readFile(filename: String) -> [String]? {
    guard let contents = try? String(contentsOfFile: filename) else {
        return nil
    }
    return contents.split(separator: "\n").map(String.init)
}

func binary2decimal(_ binary: String) -> Int {
    var amount: Double = 0
    var count: Double = 0
    for i in stride(from: binary.count-1, to: -1, by: -1) {
        if Array(binary)[i] == "1" {
            amount += pow(2.0, count)
        }
        count += 1.0
    }
    return Int(amount)
}

func main() {
    runTests()
    let sampleInput2 = readFile(filename: "sampleInput2.txt")!
    let answer = calculatePowerConsumption(sampleInput2)
    print(answer)
}

func runTests() {
    assert(readFile(filename: "nonexistentInput.txt") == nil)
    assert(readFile(filename: "garbageInput.txt")! == ["0000","0000","0000"])

    assert(binary2decimal("0") == 0)
    assert(binary2decimal("1") == 1)
    assert(binary2decimal("10") == 2)
    assert(binary2decimal("010") == 2)
    assert(binary2decimal("100") == 4)

    let garbageInput = readFile(filename: "garbageInput.txt")!
    let sampleInput = readFile(filename: "sampleInput.txt")!
    assert(calculatePowerConsumption(garbageInput) == 0)
    assert(calculatePowerConsumption(sampleInput) == 198)
    assert(calculatePowerConsumption([]) == 0)
}


main()