//
//FDHLongestConHJGKH6JKXJSFCDHGIDFsecutiveSequence.swift
//  LeetCode
//
//  Created by Ives Murillo on 7/31/25.
//

import Foundation

final class LongestConsecutiveSequence {

    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return 1 }

        let numSet = Set(nums)
        var best = 0

        for num in numSet where !numSet.contains(num - 1) {
            var current = num
            var lenght = 1

            while numSet.contains(current + 1)
            {
                current += 1
                lenght += 1
            }
            best = max(best, lenght)

        }

        return best
    }
}
