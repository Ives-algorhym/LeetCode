//
//  NextPermutation.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/16/25.
//

struct NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        // Step 1: Find pivot. the first decreasing element from the end
        var pivotIndex = nums.count - 2

        while pivotIndex >= 0 && nums[pivotIndex + 1] <= nums[pivotIndex] {
            pivotIndex -= 1
        }

        // Step 2: If pivot is found, find the next greater element to swap with
        if pivotIndex >= 0 {
            var successorIndex = nums.count - 1
            while nums[successorIndex] <= nums[pivotIndex] {
                successorIndex -= 1
            }

            nums.swapAt(pivotIndex, successorIndex)
        }

        reverse(&nums, start: pivotIndex + 1)

   }

    func reverse(_ nums: inout [Int], start: Int) {
        var left = start
        var right = nums.count - 1
        while  left  < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}

