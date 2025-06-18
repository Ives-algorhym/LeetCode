//
//  TwoSum.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/10/25.
//

@testable import LeetCode
import XCTest

final class TwoSumTests: XCTestCase {
    func test_twoSum_withSimpleMatch_shouldReturnCorrectIndeces() {
        let sut = TwoSum()
        // Act
        let result = sut.twoSum([2, 7, 11, 15], target: 9)
        // Assert
        XCTAssertEqual(result, [0, 1])
    }
}
