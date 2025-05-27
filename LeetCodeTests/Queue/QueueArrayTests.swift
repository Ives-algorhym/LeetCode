//
//  QueueArrayTests.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/24/25.
//

@testable import LeetCode
import XCTest

final class QueueArrayTests: XCTestCase {
    func test_init() {
        // Arrange
        var sut = QueueArray<String>()
        // Assert
        XCTAssertEqual(sut.array,[])
        XCTAssertTrue(sut.isEmpty)
        XCTAssertEqual(sut.peek, nil)
        let first = sut.array.first
        XCTAssertEqual(first, nil)

        _ = sut.enqueue("B")

        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.array.first, "B")
        XCTAssertEqual(sut.peek, "B")
         _ = sut.enqueue("C")
        XCTAssertEqual(sut.peek, "B")
        let dequeue = sut.dequeue()
        XCTAssertEqual(dequeue, "B")
    }
}
