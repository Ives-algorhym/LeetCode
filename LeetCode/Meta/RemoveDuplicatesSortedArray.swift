//
//  RemoveDuplicatesSortedArray.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/12/25.
//

struct RemoveDuplicatesSortedArray {
    func removeDuplicates( _ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }

        var insertIndex = 1

        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                nums[insertIndex] = nums[i]
                insertIndex += 1
            }
        }

        return insertIndex
    }
}
