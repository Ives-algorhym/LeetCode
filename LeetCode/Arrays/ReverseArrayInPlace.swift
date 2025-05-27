//
//  ReverseArrayInPlace.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/18/25.
//

import XCTest

struct ReverseArrayInPlace {
    func reverse(_ input: inout[Int]) {
        var leftPointer = 0
        var rightPointr = input.count - 1

        while leftPointer < rightPointr {
            let temp = input[leftPointer]
            input[leftPointer] = input[rightPointr]
            input[rightPointr] = temp

           // (input[leftPointer], input[rightPointr]) = (input[rightPointr], input[leftPointer])
            leftPointer += 1
            rightPointr -= 1
        }

    }
}

final class ReverseArrayInPlaceTests: XCTestCase {
    func test_reversed() {
        // Arrange
        let sut = ReverseArrayInPlace()
        var imputArray = [1,3,7]
        // Act
        sut.reverse(&imputArray)
        //
        XCTAssertEqual(imputArray, [7,3,1])

    }
}
