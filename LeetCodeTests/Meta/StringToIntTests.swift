//
//  StringToIntTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/2/25.
//

@testable import LeetCode
import XCTest

final class StringToIntTests: XCTestCase {

    var sut: StringToInt!

    override func setUp() {
        sut = StringToInt()
    }

    override func tearDown() {
        sut = nil
    }

    func test_myAtoi_shouldReturn0_whenThereIsEmptyString() {
        // Act
        let result = sut.myAtoi("")
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_myAtoi_shouldReturn0_whenStringDoesNotDigitFound() {
        // Act
        let result = sut.myAtoi("fgrls")
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_myAtoi_shouldDiscardWhiteSpacesAtBegining() {
        // Act
        let result = sut.myAtoi("     ")
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_myAtoi_shouldDiscardLeadingZeros() {
        // Act
        let result = sut.myAtoi("000000")
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_myAtoi_shouldDiscardLeading0andAppendDigits() {
        // Act
        let result = sut.myAtoi("01234")
        // Assert
         XCTAssertEqual(result, 1234)
    }

    func test_myAtoi_shoulReadAndAppendAllDigitsUntilNotDigitFoundOrEndReached() {
        // Act
        let result = sut.myAtoi("012a34")
        // Assert
        XCTAssertEqual(result, 12)
    }
}
