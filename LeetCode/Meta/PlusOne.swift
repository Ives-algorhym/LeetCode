//
//  PlusOne.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/17/25.
//

class Solution {
    /// Increments a large number represented as an array of digits.
    /// - Parameter digits: The input array where each element is a digit.
    /// - Returns: The incremented number as an array of digits.
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var index = result.count - 1

        // 🧠 Loop Invariant #1:
        // All digits after `index` (i.e., to the right) have already been turned to 0
        // because they were 9 and caused a carry.

        // 🧠 Loop Invariant #2:
        // We have not yet found a digit less than 9 to increment and return.

        // 🧠 Loop Invariant #3:
        // The loop moves from least significant to most significant digit.

        while index >= 0 {
            if result[index] < 9 {
                // ✅ We found a digit that can be incremented without carry.
                result[index] += 1
                return result
            } else {
                // 🔁 This digit is 9, so we carry: turn to 0 and continue left.
                result[index] = 0
                index -= 1
            }
        }

        // 🧠 Loop Invariant #4 (post-loop):
        // All digits were 9 → we need to insert 1 at the beginning.
        // E.g., [9,9,9] becomes [1,0,0,0]
        result.insert(1, at: 0)
        return result
    }
}
