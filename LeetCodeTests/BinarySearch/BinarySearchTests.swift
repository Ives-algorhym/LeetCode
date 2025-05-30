//
//  BinarySearchTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/29/25.
//

import XCTest

final class BinarySearchTests: XCTestCase {
    func test_binarySearch_returnsIndex_whenElementDoNotExits() {
        let array = [1, 3, 7, 9]
        let result = array.binarySearch(for: 5, in: array.startIndex..<array.endIndex)
        // Assert
        XCTAssertNil(result)
    }

    func test_binarySearch_returnsIndex_whenElementExistsAndIsInTheMiddle() {
        let array = [1, 3, 5, 7, 9]
        let result = array.binarySearch(for: 5, in: array.startIndex..<array.endIndex)
        // Assert
        XCTAssertEqual(result, 2)
    }

    func test_binarySearch_returnsIndex_whenElementExistsAndIsLessThnMiddle() {
        let array = [1, 3, 5, 7, 8,9]
        let result = array.binarySearch(for: 3, in: array.startIndex..<array.endIndex)
        // Assert
        // Assert
        XCTAssertEqual(result, 1)
    }

    func test_binarySearch_returnsIndex_whenElementExistsAndIsGraterThanMiddle() {
        let array = [1, 3, 5, 7, 8, 9]
        let result = array.binarySearch(for: 8, in: array.startIndex..<array.endIndex)
        // Assert
        // Assert
        XCTAssertEqual(result, 4)
    }
}
