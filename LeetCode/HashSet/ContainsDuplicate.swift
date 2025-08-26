//
//  ContainsDuplicate.swift
//  LeetCode
//
//  Created by Ives Murillo on 8/21/25.
//

final class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var seenNumbers = Set<Int>()
        for num in nums {
            if seenNumbers.contains(num) {
                return true
            }
            seenNumbers.insert(num)
        }
        return false
    }
}
