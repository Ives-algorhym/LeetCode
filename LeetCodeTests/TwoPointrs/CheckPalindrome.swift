//
//  CheckPalindrome.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/18/25.
//

import XCTest

struct CheckPalindrome {
    func isPalindrome(_ nums: [Int]) -> Bool{
        var left = 0    // Left starts at the begining at first element
        var right = nums.count - 1  // Rigth starts at last element

        // 
        while left < right {
            if nums[left] != nums[right] {
                return false
            }

            left += 1
            right -= 1
        }
        return true
    }
}

final class CheckPalindromeTests: XCTestCase {
    func test_checkPalindrome_isTrue() {
        let sut = CheckPalindrome()
        let nums = [1, 2, 3, 2, 1]
        // Act
        let isPalindrome = sut.isPalindrome(nums)
        // Assert
        XCTAssertTrue(isPalindrome)
    }
}
