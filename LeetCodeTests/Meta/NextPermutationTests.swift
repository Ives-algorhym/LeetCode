//
//  NextPermutationTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/13/25.
//

@testable import LeetCode
import XCTest

final class NextPermutationTests: XCTestCase {
    func test_nextPermutation_withIncreasingOrder_shouldBecomeNext() {
        // Arrange
        var nums = [1, 2, 3]
        let sut = NextPermutation()
        // Act
        sut.nextPermutation(&nums)
        // Assert
        XCTAssertEqual(nums, [1, 3, 2])
    }

    func test_reverse_shouldReverseArray() {
        // Arrange
        let sut = NextPermutation()
        var nums = [3, 2, 1]
        // Act
        sut.reverse(&nums, start: 0)
        // Assert
        XCTAssertEqual(nums, [1, 2, 3])
    }

    func test_nextPermutation_withDecendingOrder_shouldBecomeFirstPermutation() {
        // Arrange
        var nums = [3, 2, 1]
        let sut = NextPermutation()
        // Act
        sut.nextPermutation(&nums)
        // Assert
        XCTAssertEqual(nums, [1, 2, 3])
    }
}

