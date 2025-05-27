//
//  LongestSubstringKDistinctTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/23/25.
//

import XCTest


struct LongestSubstringKDistinct {
    func findLongest(_ s: String, _ k: Int) -> Int {
        // Edge cases - O(1)
        guard !s.isEmpty && k > 0 else { return 0 }

        // Covert string to array for O(1) access to characnters - O(n)
        let chars = Array(s)

        // Initialize pointers - O(1)
        var left = 0                // Left pointer starts at begining
        var right = chars.count - 1 // Right pointer starts at end
        var maxLenght = 0           // Track maximun valid substring lenght

        // Loop Invariants:
        // 1. left pointer is always at or before right pointer
        // 2. left moves right, right moves left
        // 3. we always check the substring between left and right inclusive

        // Time Complexity: O(n) where n is string length
        // Space: O(n) - In worst case, Set could contain all characters
        while left <= right {
            // Get current substring between pointers - O(n)
            let currentSubstring = Array(chars[left...right])

            // Count distinc characters - O(n)
            let distinctChars = Set(currentSubstring).count

            // If valid substring (has k or fewer distinct chars)
            if distinctChars <= k {
                // Update max length if current substring is longer - O(1)
                maxLenght = max(maxLenght, right - left + 1)
                // Move left pointer to try to find longer valid substring
                left += 1
            } else {
                // Too many distinc characters, shirnk window from right.
                right -= 1
            }
        }

        return maxLenght
    }

    func findLongestImproved(_ inputString: String, _ distink: Int) -> Int {
        
        return -1
    }
}

// "ece" is valid because it only uses 2 different letters ('e' and 'c')
// "eceb" is not valid because it uses 3 different characters ('e', 'c', 'b')
final class LongestSubstringKDistinctTests: XCTestCase {
    func test_findLongest_returnLongestSubStringInBasicCase() {
        // Arrange
        let sut = LongestSubstringKDistinct()
        // Act
        let result = sut.findLongest("eceba", 2)
        // Assert
        XCTAssertEqual(result, 3)
    }

    func test_findLongest_returnLongestSubStringEmtyString() {
        // Arrange
        let sut = LongestSubstringKDistinct()
        // Act
        let result = sut.findLongest("", 2)
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_findLongest_returnLongestSubStringAllSameCharacter() {
        // Arrange
        let sut = LongestSubstringKDistinct()
        // Act
        let result = sut.findLongest("aaaaaaaa", 2)
        // Assert
        XCTAssertEqual(result, 8)
    }
}
