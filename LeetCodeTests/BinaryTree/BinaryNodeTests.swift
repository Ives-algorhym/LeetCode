//
//  BinaryNodeTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/26/25.
//

@testable import LeetCode

import XCTest

final class BinaryNodeTests: XCTestCase {
    var binaryNode: BinaryNode<Int>!
    var tree: BinaryNode<Int>!
    override func setUpWithError() throws {
        binaryNode = BinaryNode<Int>(value: 10)
        tree =  {
          let zero = BinaryNode(value: 0)
          let one = BinaryNode(value: 1)
          let five = BinaryNode(value: 5)
          let seven = BinaryNode(value: 7)
          let eight = BinaryNode(value: 8)
          let nine = BinaryNode(value: 9)
          seven.leftChild = one
          one.leftChild = zero
          one.rightChild = five
          seven.rightChild = nine
          nine.leftChild = eight
          return seven
        }()
    }

    override func tearDownWithError() throws {
        binaryNode = nil
    }

    func test_init() {
        // Assert
        XCTAssertEqual(binaryNode.value, 10)
        XCTAssertNil(binaryNode.leftChild)
        XCTAssertNil(binaryNode.rightChild)
    }

    func test_assigningChildren() {

       // Arrange
        let rightChild = BinaryNode(value: 2)
        let leftChild = BinaryNode(value: 3)
        // Act
        binaryNode.leftChild = leftChild
        binaryNode.rightChild = rightChild

        // Assert
        XCTAssertEqual(binaryNode?.leftChild?.value, 3)
        XCTAssertEqual(binaryNode?.rightChild?.value, 2)
    }

    func test_description() {
        print(tree!)
    }

    func test_traversalInOrder_shouldVisitNodeInCorrectOrder() {
        // Arrange
        let seven = tree

        var result: [Int] = []
        // Act
        seven?.traverseInOrder { result.append($0)}
        // Assert
        XCTAssertEqual(result, [0,1,5,7,8,9])
    }

    func test_traversalPreOrder_shouldVisitNodeInCorrectOrder() {
        var result: [Int] = []
        // Act
        tree.traversePreOrder { result.append($0) }
        // Assert
        XCTAssertEqual(result, [7,1,0,5,9,8])
    }

    func test_traversalPostOrder_shouldVisitNodeInCorrectOrder() {
        // Arrange
        var result: [Int] = []
        // Act
        tree.traversePostOrder { result.append($0) }
        // Assert
        XCTAssertEqual(result, [0,5,1,8,9,7])
    }
}
