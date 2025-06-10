//
//  RomanToIntTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/9/25.
//

@testable import LeetCode
import XCTest

final class RomanToIntTests: XCTestCase {
    var sut: RomanToInt!

    override func setUp() {
        sut = RomanToInt()
    }

    override func tearDown() {
        sut = nil
    }

    func test_singleI_shouldReturtn1() {
        // Act
        let result = sut.romanToInt("I")
        // Assert
        XCTAssertEqual(result, 1)
    }

    func test_twoI_shouldReturn2() {
        // Act
        let result = sut.romanToInt("II")
        // Assert
        XCTAssertEqual(result, 2)
    }

    func test_IV_shouldReturn4() {
        // Act
        let result = sut.romanToInt("IV")
        // Assert
        XCTAssertEqual(result, 4)
    }

    func test_V_shouldReturn5() {
        // Act
        let result = sut.romanToInt("V")
        // Assert
        XCTAssertEqual(result, 5)
    }

    func test_VI_shouldReturn6() {
        // Act
        let result = sut.romanToInt("VI")
        // Assert
        XCTAssertEqual(result, 6)
    }

    func test_IX_shouldReturn9() {
        // Act
        let result = sut.romanToInt("IX")
        // Assert
        XCTAssertEqual(result, 9)
    }

    func test_XL_shouldReturn40() {
        // Act
        let result = sut.romanToInt("XL")
        // Assert
        XCTAssertEqual(result, 40)
    }

    func test_LVIII_shouldReturn58() {
        // Act
        let result = sut.romanToInt("LVIII")
        // Assert
        XCTAssertEqual(result, 58)
    }

    func test_MCMXCIV_shouldReturn1994() {
        // Act
        let result = sut.romanToInt("MCMXCIV")
        // Assert
        XCTAssertEqual(result, 1994)
    }
}
