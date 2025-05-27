//
//  FindEvenNumbers.swift
//  LeetCode
//
//  Created by Ives Murillo on 11/16/24.
//

import XCTest

final class SolutionEvenNumbers {
    let nums = [12,345,2,6,7896]
    func findEven()  -> Int {
        return nums.filter { String($0).count % 2 == 0 }.count
    }
}

final class FindEvenNumbersTests: XCTestCase {
    var sut: SolutionEvenNumbers!
    func test_init() {
        sut = SolutionEvenNumbers()

        // When
        let even = sut.findEven()
        // Then
        XCTAssertEqual(even, 2)
    }
}
