//
//  HappyNumberTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 8/25/25.
//
@testable import LeetCode
import XCTest

final class HappyNumberTests: XCTestCase {
    func test_isHappy_returnsTrueForOne() {
        // Arrange
        let sut = HappyNumber()
        // Act
        let result = sut.isHappy(1)
        // Assert
        XCTAssertTrue(result)
    }

    func test_isHappy_returnsTrueForHappyNumber() {
        // Arrange
        let sut = HappyNumber()
        // Act
        let result = sut.isHappy(7)
        // Assert
        XCTAssertTrue(result)
    }

    func test_isHappy_returnFalseForUnHappyNumber() {
        // Arrange
        let sut = HappyNumber()
        // Act
        let result = sut.isHappy(4)
        // Arrange
        XCTAssertFalse(result)
    }
}
