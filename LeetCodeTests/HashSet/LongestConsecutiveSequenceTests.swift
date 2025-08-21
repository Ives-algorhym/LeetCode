//
//  LongestConsecutiveSequenceTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 7/31/25.
//


@testable import LeetCode
import XCTest

final class LongestConsecutiveSequenceTests: XCTestCase {
    func test_emptyArray_returnZero() {
        // Arrange
        let nums = [Int]()
        let sut = LongestConsecutiveSequence()
        // Act
        let result = sut.longestConsecutive(nums)
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_singleElement_returnOne() {
        // Arrange
        let nums = [1]
        let sut = LongestConsecutiveSequence()
        // Act
        let result = sut.longestConsecutive(nums)
        // Assert
        XCTAssertEqual(result, 1)
    }

    func test_twoElementsWithCondecutiveNumbers_returnTwo() {
        // Arrange
            let nums = [1, 2]
        let sut = LongestConsecutiveSequence()
        // Act
        let result = sut.longestConsecutive(nums)
        // Assert
        XCTAssertEqual(result, 2)
    }

    func test_multipleElementsWithConsecutiveNumbers_returnLongestSequence() {
        // Arrange
        let nums = [100, 4, 200, 1, 3, 2]
        let sut = LongestConsecutiveSequence()
        // Act
        let result = sut.longestConsecutive(nums)
        // Assert
        XCTAssertEqual(result, 4)
    }
}
