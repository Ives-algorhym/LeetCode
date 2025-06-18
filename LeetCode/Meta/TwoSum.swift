//
//  TwoSum.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/10/25.
//

struct TwoSum {
    func twoSumBruteForce(_ nums: [Int], target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[j] == target - nums[i] {
                    return [i, j]
                }
            }
        }
        return []
    }

    func twoSumTwoPass(_ nums: [Int], target: Int) -> [Int] {
        var map: [Int: Int] = [:]

        // First pass populate the map
        // Invariant: after each iteration, map contains the indices of the numbers seen so far.
        // This allows us to check for complements in O(1) time.
        for i in 0..<nums.count { // O(n)
            let key = nums[i]
            map[key] = i
        }

        // Second pass to find the complemet
        // Invariant: at the start of each iteration i, for all previous indices 0..i-1,
        // the map contains each value's most recent index,
        // and we are checking if the complement exists and is not the same index.
        // This guarantees that if a valid pair exists, we'll find it by checking againgst the full map.
        for i in 0..<nums.count {
            let complement = target - nums[i]
            if let complementIndex = map[complement], complementIndex != i {
                return [i, complementIndex]
            }
        }
        return []
    }

    func twoSum(_ nums: [Int], target: Int) -> [Int] {
        var map: [Int: Int] = [:]

        // Invariant: At the start of each iteration i, `map` contains every number seen so far
        // as a key, with its index as the value. This allows O(1) lookup to check if the complement exists.
        //
        // Asymptotic analysis:
        // - Time complexity: O(n), where n is the number of elements in `nums`.
        //   Each element is processed exactly once, and map lookups/inserts are O(1) on average.
        // - Space complexity: O(n) for the hashmap storing up to n elements.
        for (i, num) in nums.enumerated() {
            let complement = target - num

            // O(1) lookup: check if the complement has already been seen.
            if let complementIndex = map[complement] {
                return [complementIndex, i] // Found the solution early; return immediately.
            }

            // Store the current number with its index.
            // Guarantees that on next iterations, this value can be matched as a complement.
            map[num] = i
        }

        // If no solution is found, return an empty array.
        return []
    }
}

