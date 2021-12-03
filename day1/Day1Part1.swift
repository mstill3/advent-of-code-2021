#!/usr/bin/swift

func countLargerThanPrevious(nums: [Int]) -> Int{
    var bigger = 0
    for (index, num) in nums.enumerated() {
        if index > 0 && num > nums[index-1] {
            bigger += 1
        }
    }
    return bigger
}

let sampleInput = [199,200,208,210,200,207,240,269,260,263]

func main() {
    runTests()
    let answer = countLargerThanPrevious(nums: sampleInput)
    print(answer)
}

func runTests() {
    assert(countLargerThanPrevious(nums: []) == 0)
    assert(countLargerThanPrevious(nums: [3,2,1]) == 0)
    assert(countLargerThanPrevious(nums: [1,2,3]) == 2)
    assert(countLargerThanPrevious(nums: [199,200,208,210,200,207,240,269,260,263]) == 7)
}


main()