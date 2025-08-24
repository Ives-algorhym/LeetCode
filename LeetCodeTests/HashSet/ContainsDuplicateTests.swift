//
//  ContainsDuplicateTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 8/21/25.
//

@testable import LeetCode
import XCTest

final class ContainsDuplicateTests: XCTestCase {
    func test_containsDuplicate_withEmtyArray() {
        // Arrange
        let sut = ContainsDuplicate()
        let nums: [Int] = []
        // Act
        let result = sut.containsDuplicate(nums)
        // Assert
        XCTAssertFalse(result)
    }

    func test_containsDuplicate_withSingleElementArray() {
        // Arrange
        let sut = ContainsDuplicate()
        let nums = [1]
        // Act
        let result = sut.containsDuplicate(nums)
        // Assert
        XCTAssertFalse(result)
    }

    func test_containsDuplicate_withTwoDifferentElements() {
        // Arrange
        let sut = ContainsDuplicate()
        let nums = [1, 2]
        // Act
        let result = sut.containsDuplicate(nums)
        // Assert
        XCTAssertFalse(result)
    }

    func test_containsDuplicate_withTwoSameElements() {
        // Arrange
        let sut = ContainsDuplicate()
        let nums = [1, 1]
        // Act
        let result = sut.containsDuplicate(nums)
        // Assert
        XCTAssertTrue(result)
    }
}
