#!/usr/bin/swift
import Foundation

func calculateHorizontalPositionTimesDepth(filename: String) -> Int {
    // Read the contents of the specified file
    let contents = try! String(contentsOfFile: filename)

    // Split the file into separate lines
    let lines = contents.split(separator:"\n")

    var vertical = 0
    var horizontal = 0
    // Iterate over each line and print the line
    for line in lines {
        // print("\(line)")
        if line.contains("forward") {
            let amount = Int(line.replacingOccurrences(of: "forward ", with: ""))!
            horizontal += amount
        } else if line.contains("down") {
            let amount = Int(line.replacingOccurrences(of: "down ", with: ""))!
            vertical += amount
        } else if line.contains("up") {
            let amount = Int(line.replacingOccurrences(of: "up ", with: ""))!
            vertical -= amount
        }
    }

    return horizontal * vertical
}

func main() {
    runTests()
    let answer = calculateHorizontalPositionTimesDepth(filename: "sampleInput2.txt")
    print(answer)
}

func runTests() {
    assert(calculateHorizontalPositionTimesDepth(filename: "garbageInput.txt") == 0)
    assert(calculateHorizontalPositionTimesDepth(filename: "sampleInput.txt") == 150)
}


main()