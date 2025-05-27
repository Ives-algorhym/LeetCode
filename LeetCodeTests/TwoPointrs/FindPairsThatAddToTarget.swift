//
//  FindPairsThatAddToTarget.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/16/25.
//

import XCTest

final class FindPairsThatAddupGetTarget {

    func find (_ numbers: [Int], target: Int) -> [Int] {
        var leftPointer = 0
        var rigthPointer = numbers.count - 1

        while leftPointer < rigthPointer {
            let sum = numbers[leftPointer] + numbers[rigthPointer]

            if sum == target {
                return [numbers[leftPointer], numbers[rigthPointer]]
            }

            if sum < target {
                leftPointer += 1
            } else {
                rigthPointer -= 1
            }

        }
        return []
    }
}

final class FindPairsThatAddToTargetTests: XCTestCase {

    func test_find_shoulReturnPairs() {
        // Arrange
        let sut = FindPairsThatAddupGetTarget()
        let imputArray = [1, 3, 4, 7, 8, 9]
        let target = 10
        // Act
        let pairs = sut.find(imputArray, target: target)
        // Assert
        XCTAssertEqual(pairs, [1, 9])
    }

    func test_find_shouldReturnEmptyArray() {
        // Arrange
        let sut = FindPairsThatAddupGetTarget()
        let imputArray = [1, 3, 4, 7, 8, 9]
        let target = 6
        // Act
        let pairs = sut.find(imputArray, target: target)
        // Assert
        XCTAssertEqual(pairs, [])
    }
}
