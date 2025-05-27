//
//  InPlaceOperationsTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 3/9/25.
//

import XCTest

final class SquareEvery {
    func squareEvery(_ arr: [Int]?, length: Int) -> [Int]? {
        guard var arr else { return nil }

        for i in stride(from: 0, to: length, by: 2) {
            arr[i] *= arr[i]
        }

       return arr
    }
}
final class InPlaceOperationsTests: XCTest {
    func test_squareEvery() {
        // Assert
        let sut = SquareEvery()

        // Act
        let squared = sut.squareEvery([2,3,9,7], length: 4)

        // Assert
        XCTAssertEqual(squared, [4,3,81,7])
    }
}

