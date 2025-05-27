//
//  GreatestOnRightSideTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 3/10/25.
//

import XCTest

final class GreatestOnRightSide {
    func replaceElements(_ arr: inout[Int]){
        var maxRigh = -1
        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            let current = arr[i]
            arr[i] = maxRigh
            maxRigh = max(maxRigh, current)
        }
    }
}

final class GreatestOnRightSideTests: XCTestCase {
    func test_replaceElements() {
        // Assert
        var result = [17,18,5,4,6,1]
        let sut = GreatestOnRightSide()

        // Arrenge
        sut.replaceElements(&result)

        // Assert
        XCTAssertEqual(result, [18,6,6,6,1,-1])
    }
}
