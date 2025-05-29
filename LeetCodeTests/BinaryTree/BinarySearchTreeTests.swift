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
        let sut = BinarySearchTree<Int>()
        // Assert
        XCTAssertNotNil(sut)
        XCTAssertNil(sut.testHooks.root)
        print(sut)
    }

    func test_insert_shouldInsertValueInRoot() {
        // Arrange
        var sut = BinarySearchTree<Int>()
        // Act
        sut.insert(5)
        // Assert
        XCTAssertEqual(sut.testHooks.root?.value, 5)
    }

    func test_insertFromNil_shouldReturnANewNode() {
        // Arrange
        let sut = BinarySearchTree<Int>()
        // Act
        let result = sut.insert(from: nil, value: 10)
        // Assert
        XCTAssertEqual(result.value, 10)
    }

    func test_insertFromLessThanNodeValue_goesToLeftChild() {
        let node = BinaryNode(value: 10)
        let sut = BinarySearchTree<Int>()
        // Act
        let result  = sut.insert(from: node, value: 5)
        // Assert
        XCTAssertEqual(result.leftChild?.value, 5)
    }

    func test_insertFromGreaterThanNodeValue_goesToRightChild() {
        // Arrange
        let sut = BinarySearchTree<Int>()
        let node = BinaryNode(value: 10)
        // Act
        let result = sut.insert(from: node, value: 15)
        // Assert
        XCTAssertEqual(result.rightChild?.value, 15)
    }

    func test_contains_shouldReturnFalseWhenNodeIsNotInTheTree() {
        // Arrange
        let sut = BinarySearchTree<Int>()
        let result = sut.contains(10)
        // Assert
        XCTAssertFalse(result)
    }

    func test_contains_shouldReturnTrueWhenNodeIsInTheTree() {
        // Arrange
        var sut = BinarySearchTree<Int>()
        sut.insert(10)
        // Act
        let result = sut.contains(10)
        // Assert
        XCTAssertTrue(result)
        sut.insert(5)
        XCTAssertTrue(sut.contains(5))
        sut.insert(15)
        XCTAssertTrue(sut.contains(15))
    }

    func test_remove_shouldDoNothingWhenNodeDoesNotExist() {
        let sut = BinarySearchTree<Int>()
        let node = BinaryNode<Int>(value: 24)
        _ = sut.remove(node: node, 24)
        XCTAssertFalse(sut.contains(24))
    }

    func test_remove_shouldRemoveNodeWhenNodeExists() {
        var sut = BinarySearchTree<Int>()
        sut.insert(24)

        sut.remove(24)

        XCTAssertFalse(sut.contains(24))
    }
}
