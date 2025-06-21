//
//  MultiplyStringsTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/19/25.
//

@testable import LeetCode
import XCTest

final class MultiplyTests: XCTestCase {
    func test_multiplyOneDigit_shouldReturnZero() {
        // Arrange
        let sut = MultiplyStrings()
        let num1Reversed = "32"
        let digit: Character = "2"
        let i = 0
        // Act
        let result = sut.multiplyOneDigit(num1Reversed, digit, i)
        // Assert
        XCTAssertEqual(result, [6, 4])
    }

    func test_multiplyWithZero_shouldReturnZero() {
        // Arrange
        let sut = MultiplyStrings()
        // Act
        let result = sut.multiply("24", "0")
        // Assert
        XCTAssertEqual(result, "0")
    }

    func test_multiplyWithOne_shouldReturnSame() {
        // Arrange
        let sut = MultiplyStrings()
        // Act
        let result = sut.multiply("24", "1")
        // Assert
        XCTAssertEqual(result, "24")
    }

    func test_multiplyWithOne_shouldReturnSameNumber() {
        // Arrange
        let sut = MultiplyStrings()
        // Act
        let result = sut.multiply("1", "3")
        // Assert
        XCTAssertEqual(result, "3")
    }
}
