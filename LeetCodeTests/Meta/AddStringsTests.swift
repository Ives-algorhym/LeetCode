//
//  AddStringsTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/18/25.
//

@testable import LeetCode
import XCTest

final class AddStringsTests: XCTestCase {
    func test_addString_basicAddition() {
        // Arrange
        let sut = AddString()
        // Act
        let result = sut.addString("2", "3")
        // Assert
        XCTAssertEqual(result, "5")
    }

    func test_addString_singleDigitWithCarry() {
        // Assert
        let sut = AddString()
        // Act
        let result  = sut.addString("7", "8")
        // Assert
        XCTAssertEqual(result, "15")
    }

    func test_addString_differentLengths() {
        // Arrange
        let sut = AddString()
        // Act
        let result = sut.addString("9", "99")
        // Assert
        XCTAssertEqual(result, "108")
    }
}
