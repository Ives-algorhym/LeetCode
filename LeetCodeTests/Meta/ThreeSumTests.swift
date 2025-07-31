//
//  3SumTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/10/25.
//

@testable import LeetCode
import XCTest

final class ThreeSumTests: XCTestCase {
    func test_threeSum_withSimpleTriplet_shouldReturnTriplet() {
        // Arrange
        let sut = ThreeSum()
        let result = sut.threeSum([-1, 0, 1, 2])
        // Assert
        XCTAssertEqual(result, [[-1, 0, 1]])
    }

    func test_threeSum_withMultipleTriplets_shouldReturnAllTriplets() {
        // Arrange
        let sut = ThreeSum()
        let expected = [[-1, -1, 2], [-1, 0, 1]]
        // Act
        let result = sut.threeSum([-1, 0, 1, 2, -1, -4])
        // Assert
        XCTAssertEqual(result, expected)
    }

    func test_findTwoSum_withSingleValidPair_shouldReturnPair()  {
        // Arrange
        let sut = ThreeSum()
        var result = [[Int]]()
        let nums = [-2, 0, 2, 3]
        // Act
        sut.twoSum(nums, anchorIndex: 0, result: &result)
        // Assert
        XCTAssertEqual(result, [[-2, 0, 2]])
    }

    func test_findTwoSum_withNoPair_shouldNotAppendAnything() {
        let sut = ThreeSum()
        var result = [[Int]]()
        let nums = [-3, 1, 4, 5]
        // Act
        sut.twoSum(nums, anchorIndex: 0, result: &result)
        // Assert
        XCTAssertTrue(result.isEmpty)
    }

    func testTripletsSumToTarget() {
        // Arrange
        let sut = ThreeSum()
        let nums = [1, 2, -2, -1, 0]
        let target = 1
        let actual = sut.threeSumTarget(nums, target: 1)
            .map { $0.sorted() }
            .sorted(by: { $0.lexicographicallyPrecedes($1) })

        let expected = [
            [-1, 0, 2],
            [-2, 1, 2]
        ].sorted(by: { $0.lexicographicallyPrecedes($1) })

        XCTAssertEqual(actual, expected)
    }

    func testNegativeTarget() {
        let sut = ThreeSum()
        let result = sut.threeSumTarget([-5, -2, 0, 2, 3], target: 5)
        let expected: Set<Set<Int>> = [Set([ 0, 2, 3])] // Update based on valid triplets
        let resultSet = Set(result.map { Set($0) })
        XCTAssertTrue(expected.isSubset(of: resultSet) || resultSet == expected)
    }
}


