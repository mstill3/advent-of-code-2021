import Foundation
import ArgumentParser

extension Command {
  struct Day1Part2: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "day1part2",
        abstract: "Counts number of larger groups of 3 than previous in number array"
      )
    }

    // @Argument(help: "JSON containing the array of nums to check")
    // var numsArrayJSON: String

    func run() throws {
        let sampleInput = [		
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

        let answer = countGroups3LargerThanPrevious(nums: sampleInput)
        print(answer)
    }

    func countGroups3LargerThanPrevious(nums: [Int]) -> Int{
        var numLarger = 0
        var groupNum = 0
        var previousGroupSum = 0
        var currentGroupSum = 0
        
        for (index, _) in nums.enumerated() {
            if index > nums.count - 3 {
                break;
            }
            if groupNum == 0 {
                previousGroupSum = sumNext3(nums: nums, index: index)
            } else {
                currentGroupSum = sumNext3(nums: nums, index: index)
                if currentGroupSum > previousGroupSum {
                    numLarger += 1;
                }
                previousGroupSum = currentGroupSum
            }
            groupNum += 1;
        }
        return numLarger
    }

    func sumNext3(nums: [Int], index: Int) -> Int {
        return nums[index] + nums[index + 1] + nums[index + 2]
    }

  }
}