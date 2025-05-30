//
//  HashSetTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/29/25.
//

@testable import LeetCode
import XCTest


final class MyHashSetTests: XCTestCase {
    func test_hashFunctionMapKeysToBucketIndex() {
        // Arrange
        let set = MyHashSet()
        let key = 24
        let expectedIndex = key % 769
        // Act
        let actualIndex = set.testTableHash(key)
        // Assert
        XCTAssertEqual(actualIndex, expectedIndex)
    }

    func test_containsKey() {
        // Arrange
        let set = MyHashSet()
        let key = 24
        set.manuallyInsert(key)
        // Act
        let doExistsKey = set.contains(key)
        // Assert
        XCTAssertTrue(doExistsKey)
    }

    func test_AddInsertsKey() {
        // Arrange
        let set = MyHashSet()
        let expectedBucketIndex = 24 % 769
        // Act
        set.add(24)
        let bucket = set.getBucket(at: expectedBucketIndex)
        // Assert
        XCTAssertTrue(bucket.exits(24))
    }

    func test_removeKeyFromCorrectBucket() {
        // Arrange
        let set = MyHashSet()
        set.add(24)
        // Act
        set.remove(24)
        // Assert
        XCTAssertFalse(set.contains(24))
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
