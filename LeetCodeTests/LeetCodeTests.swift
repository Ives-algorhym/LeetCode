//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 11/16/24.
//

import XCTest
@testable import LeetCode

final class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        let stringNumbers = nums.map(String.init).joined()
        let groups = stringNumbers.split(separator: "0")
        let maxGroupLength = groups.map {
            $0.count
        }.max() ?? 0
        return maxGroupLength
    }

}

final class LeetCodeTests: XCTestCase {

    var sut: Solution!

    override func setUpWithError() throws {
    sut = Solution()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_init() {
        XCTAssertNotNil(sut)
    }

    func test_findMax_shouldBeThree() {
        // Given
        let nums = [1, 1, 0, 1, 1, 1]
        // When
        let max = sut.findMaxConsecutiveOnes(nums)
        // Then
        XCTAssertEqual(max, 3)
    }
}
