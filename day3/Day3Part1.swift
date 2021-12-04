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

func calculatePowerConsumption(filename: String) -> Int {
    // Read the contents of the specified file
    let contents = try! String(contentsOfFile: filename)

    // Split the file into separate lines
    let lines = contents.split(separator:"\n")

    var colFreq: [Count] = []
    let numCols = lines[0].count

    for _ in 0...numCols-1 {
        colFreq.append(Count())
    }

    // Iterate over each line and print the line
    for line in lines {
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
    let answer = calculatePowerConsumption(filename: "sampleInput2.txt")
    print(answer)
}

func runTests() {
    assert(binary2decimal("0") == 0)
    assert(binary2decimal("1") == 1)
    assert(binary2decimal("10") == 2)
    assert(binary2decimal("010") == 2)
    assert(binary2decimal("100") == 4)

    assert(calculatePowerConsumption(filename: "garbageInput.txt") == 0)
    assert(calculatePowerConsumption(filename: "sampleInput.txt") == 198)
}


main()