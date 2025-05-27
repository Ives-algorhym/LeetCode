//
//  NodeTest.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/24/25.
//

@testable import LeetCode
import XCTest

final class NodeTest: XCTestCase {
    func test_init() {
        // Arrange
        let sut = Node(value: 4, next: nil)
        // Assert
        XCTAssertEqual(sut.value, 4)
        XCTAssertNil(sut.next)
    }

    func test_nodeDescription() {
        // Arrange
        let node2 = Node(value: 3, next: nil)
        let node1 = Node(value: 2, next: node2)
        let sut = Node(value: 1, next: node1)
        sut.next = node1
        node1.next = node2
        let expectedDescription = "1 -> 2 -> 3"
        // Act
        let description = sut.description
        // Assert
        XCTAssertEqual(description, expectedDescription)
    }
}

