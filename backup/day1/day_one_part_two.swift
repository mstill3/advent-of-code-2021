#!/usr/bin/swift
import ArgumentParser


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


@main
func main() {
    let input = [];  //read and parse input
    let answer = countGroups3LargerThanPrevious(nums: sampleInput)
    print(answer)
}