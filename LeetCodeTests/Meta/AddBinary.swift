//
//  AddBinary.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/17/25.
//

@testable import LeetCode
import XCTest

final class AddBinaryTests: XCTestCase {
    func test_addBinary() {
        // Arrange
        let sut = AddBinary()
        //  Act
        let result = sut.addBinary("11", "1")
        // Assert
        XCTAssertEqual(result, "100")
    }

    func test_addBinary_withEqualenghtAndCarry() {
        // Arrange
        let sut = AddBinary()
        // Act
        let result = sut.addBinary("1010", "1011")
        // Assert
        XCTAssertEqual(result, "10101")
    }
}
