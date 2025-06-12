//
//  ThreeSum.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/11/25.
//

struct ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var result = [[Int]]()

        for i in 0..<sorted.count where sorted[i] <= 0 {
            guard i == 0 || sorted[i] != sorted[i - 1] else {
                continue
            }

            twoSum(sorted, anchorIndex: i, result: &result)
        }

        return result
    }

    func twoSum(_ nums: [Int], anchorIndex: Int, result: inout [[Int]]) {
        var left = anchorIndex + 1
        var right = nums.count - 1

        while left < right {
            let sum = nums[anchorIndex] + nums[left] + nums[right]

            switch sum {
            case ..<0:
                left += 1
            case 1...:
                right -= 1
            default:
                result.append([nums[anchorIndex], nums[left], nums[right]])

                left += 1
                right -= 1

                while left < right && nums[left] == nums[left - 1] {
                    left += 1
                }
            }
        }
    }
}
