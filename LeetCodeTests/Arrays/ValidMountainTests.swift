//
//  ValidMountainTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 3/9/25.
//

import XCTest

final class ValidMountainArray {
    func validMountainArray(_ A: [Int]) -> Bool {
        let N = A.count
        var i = 0

        // Walk up
        while i + 1 < N && A[i] < A[i + 1] {
            i += 1
        }

        // Peak can't be firtst or last
        if i == 0 || i == N - 1 {
            return false
        }

        // Walk down
        while i + 1 < N && A[i] > A[i + 1] {
              i += 1
        }

        return i == N - 1
    }
}

final class ValidMountainTests: XCTestCase {
    func test_validMountainArray() {
        // Arrange
        let sut = ValidMountainArray()

        // Act
        let isValidMountain = sut.validMountainArray([2,4,6,5,3])

        // Assert
        XCTAssertTrue(isValidMountain)
    }
}

