//
//  RemoveDuplicatesSortedArray.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/12/25.
//

@testable import LeetCode
import XCTest

final class RemoveDuplicatesSortedArrayTests: XCTestCase  {
    func test_removeDuplicates_onEmptyArray_shouldReturnZero() {
        let sut = RemoveDuplicatesSortedArray()
        var nums: [Int] = []
        // Act
        let result = sut.removeDuplicates(&nums)
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_removeDuplicates_onSingleElementArray_ShouldReturnOne() {
        // Arrange
        let sut = RemoveDuplicatesSortedArray()
        var nums = [1]
        // Act
        let result = sut.removeDuplicates(&nums)
        // Assert
        XCTAssertEqual(result, 1)
    }

    func test_removeDuplicates_onArrayWithDuplicates_shouldReturnUniqueCount() {
        // Arrange
        let sut = RemoveDuplicatesSortedArray()
        var nums = [1, 1, 2, 2, 3]
        // Act
        let result = sut.removeDuplicates(&nums)
        // Assert
        XCTAssertEqual(result, 3)
    }
}
