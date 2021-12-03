#!/usr/bin/swift

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

let sampleInput = [199,200,208,210,200,207,240,269,260,263]

func main() {
    runTests()
    let answer = countGroups3LargerThanPrevious(nums: sampleInput)
    print(answer)
}

func runTests() {
    assert(countGroups3LargerThanPrevious(nums: []) == 0)
    assert(countGroups3LargerThanPrevious(nums: [3,2,1]) == 0)
    assert(countGroups3LargerThanPrevious(nums: [1,2,3,4]) == 1)
    assert(countGroups3LargerThanPrevious(nums: [199,200,208,210,200,207,240,269,260,263]) == 5)
}


main()