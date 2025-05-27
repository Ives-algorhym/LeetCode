//
//  BetterRepetedDeletionsTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 3/17/25.
//

import XCTest

final class BetterRepetedDeletions {
    func removeDuplicates(_ imputArray: inout [Int]) -> Int {
        // The initial length is simply the array count.
        var length = imputArray.count

        // Assume the last element is always unique.
        // Then for each element, delete if it is the same
        // as the one after it. Use our deletion algorithm
        // for deleting from any index.
        for index in stride(from: length - 2, through: 0, by: -1) {
            if imputArray[index] == imputArray[index + 1] {
                // Remove the elements at index index
                imputArray.remove(at: index + 1)
                // Return the new length by 1
                length -= 1
            }
        }

        return length
    }
}

final class BetterRepetedDeletionsTests: XCTestCase {
    func test_removeDuplicates() {
        // Arrange
        let sut = BetterRepetedDeletions()
        var imputArray = [0,0,1,1,1,2,2,3,3,4]
        let expected = [0,1,2,3,4]

        // Act
        let result = sut.removeDuplicates(&imputArray)

        // Arrange
        XCTAssertEqual(result, expected.count)
        XCTAssertEqual(expected, imputArray)

    }
}
