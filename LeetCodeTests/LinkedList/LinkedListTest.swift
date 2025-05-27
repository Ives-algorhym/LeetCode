//
//  LinkedListTest.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/24/25.
//

@testable import LeetCode
import XCTest

final class LinkedListTest: XCTestCase {

    var sut: LinkedList<Int>!

    override func setUp() {
        sut = LinkedList()
    }

    override func tearDown() {
        sut = nil
    }
    func test_init() {
        // Arrange
        let sut = LinkedList<Int>()
        // Assert
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertTrue(sut.isEmpty)
    }

    func test_pushAddNodeToFrontOfList() {
        // Arrange
        var sut = LinkedList<Int>()
        // Act
        sut.push(2)
        // Assert
        XCTAssertEqual(sut.head?.value, 2)
        XCTAssertEqual(sut.tail?.value, 2)
    }

    func test_pushMultipleValues() {
        // Arrange
        var sut = LinkedList<Int>()
        let expectedDescription = "1 -> 2 -> 3"
        // Act
        sut.push(3)
        sut.push(2)
        sut.push(1)
        // Assert
        XCTAssertEqual(sut.description, expectedDescription)
    }

    func test_append() {
        // Arrange
        var sut = LinkedList<Int>()
        // act
        sut.append(24)
        // Assert
        XCTAssertEqual(sut.tail?.value, 24)
    }

    func test_insert() {
        // Arrange
        var sut = LinkedList<Int>()
        sut.push(24)
        sut.append(4)
        sut.push(11)
        sut.append(8)
        // Act
        let node = sut.getNode(at: 1)
        let nodeII = sut.getNode(at: 2)
        // Assert
        XCTAssertEqual(node?.value, 24)
        XCTAssertEqual(nodeII?.value, 4)
        // Act
        _ = sut.insert(4, after: node!)
        // Assert
        print(sut.getNode(at: 1)?.value as Any, 4)
        XCTAssertEqual(sut.getNode(at: 2)?.value, 4)
    }

    func test_popShouldRemoveNodeAtFrontsOfList() {
        // Arrange
        sut.append(2)
        sut.append(4)
        sut.append(8)
        // Act
        let result = sut.pop()
        // Assert
        XCTAssertEqual(result, 2)
    }

    func test_popMakeListEmptyWhenOnlyOneElement() {
        // Arrange
        sut.push(24)
        // Act
        sut.pop()
        // Assert
        XCTAssertTrue(sut.isEmpty)
        let result = sut.pop()
        XCTAssertNil(result)
    }

    func test_removeLastShouldRemoveTheTail() {
        // Arrange
        sut.push(24)
        sut.push(8)
        sut.push(4)
        // Act
        _ = sut.removeLast()
        // Assert
        let oldTailPrevioul = sut.tail?.previous
        XCTAssertEqual(sut.tail?.value, 8)
        XCTAssertEqual(sut.tail?.previous, oldTailPrevioul )
    }

    func test_removeAfter() {
        sut.push(8)
        sut.push(4)
        sut.push(2)
        sut.push(6)
        // Assert
        let node = sut.getNode(at: 1)!
        print(node)
        let nextOfRemoved = node.next?.next
        let removed = sut.removeAfter(node)
        XCTAssertEqual( removed, 4)
        XCTAssertEqual(node.next, nextOfRemoved)
        XCTAssertEqual(nextOfRemoved?.previous, node)
    }

    func test_traverseBackwards_shouldReachHead_pushShouldUpdatePrevious() {
        sut.push(3)
        sut.push(2)
        sut.push(1)
        var currentNode = sut.tail
        XCTAssertEqual(currentNode?.value, 3)

        currentNode = currentNode?.previous
        XCTAssertEqual(currentNode?.value, 2)

        currentNode = currentNode?.previous
        XCTAssertEqual(currentNode?.value, 1)
    }

    func test_traverseBackwards_shouldReachHead_appendShouldUpdatePrevious() {
        sut.append(1)
        sut.append(2)
        sut.append(3)
        var currentNode = sut.tail
        XCTAssertEqual(currentNode?.value,3)

        currentNode = currentNode?.previous
        XCTAssertEqual(currentNode?.value, 2)

        currentNode = currentNode?.previous
        XCTAssertEqual(currentNode?.value, 1)

        currentNode = currentNode?.previous
        XCTAssertNil(currentNode)
    }

    func test_insertShouldUpdatePrevious() {
        sut.push(1)
        let node = sut.head!
        let inserted = sut.insert(2, after: node)

        XCTAssertEqual(node.next, inserted)
        XCTAssertEqual(inserted.previous, node)
    }

    func test_insertShouldUpdatePreviousPointerCorrectly() {
        // Arrange
        sut.append(1)
        let firstNode = sut.head!
        // Act
        let insertedNode = sut.insert(2, after: firstNode)
        // Assert
        XCTAssertEqual(firstNode.next, insertedNode )
        XCTAssertEqual(insertedNode.previous, firstNode)
        sut.append(3)
        XCTAssertEqual(insertedNode.next?.previous, insertedNode)
    }

    func test_pop_shouldUnlinkOldHead() {
        // Arrange
        sut.append(1)
        sut.append(2)
        let oldHead = sut.head
        let newHead = oldHead?.next
        // Act
        sut.pop()
        // Assert
        XCTAssertTrue(sut.head === newHead)
        XCTAssertNil(sut.head?.previous)
        XCTAssertNil(oldHead?.next)
    }
}
