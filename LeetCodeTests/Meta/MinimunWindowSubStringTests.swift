//
//  MinimunWindowSubStringTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/23/25.
//

@testable import LeetCode
import XCTest

final class MinimunWindowSubStringTests: XCTestCase {
    func test_init() {
        // Assert
        let str1 = ""
        let str2 = ""
        // Act
        let result = minWindow(str1, str2)
        // Assert
        XCTAssertEqual(result, "")
    }

    func test_minWindow_singleCharMatch_returnsSameChar() {
        // Assert
        let s = "a"
        let t = "a"
        // Act
        let result = minWindow(s, t)
        // Assert
        XCTAssertEqual(result, "a")
    }

    func test_miniWindow_basicCase_returnsCorrectWindow() {
        // Arrange
        let s = "ADOBECODEBANC"
        let t = "ABC"
        // Act
        let result = minWindow(s, t)
        // Assert
        XCTAssertEqual(result, "BANC")
    }
}
