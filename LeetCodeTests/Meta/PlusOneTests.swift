//
//  PlusOneTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/17/25.
//

import XCTest

final class PlusOneTests: XCTestCase {
    func test_plusOneAddOneWithoutCarry() {
        // Arrange
        let sut = PlusOne()
        // Act
        let result = sut.plusOne([1, 2, 3])
        // Assert
        XCTAssertEqual(result, [1, 2, 4])
    }
}

struct PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var index = result.count - 1

        // Step 1: Iterate from the last digit
        while index >= 0 {
            // No carry needed
            if result[index] < 9 {
                result[index] += 1
                return result
            } else {
                // 9 turns to 0, carry to the left
                result[index] = 0
                index -= 1
            }
        }

        // Step 2: If we reach here, it means all were 9s, e.g. [9, 9] -> [1, 0, 0]
        result.insert(1, at: 0)
        return result
    }

}
