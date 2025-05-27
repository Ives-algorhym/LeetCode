//
//  BinarySearchTreeTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/27/25.
//

@testable import LeetCode
import XCTest

final class BinarySearchTreeTests: XCTestCase {
    func test_init() {
        // Arrange
        let sut = BinarySearchTree()
        // Assert
        XCTAssertNotNil(sut)
    }
}
