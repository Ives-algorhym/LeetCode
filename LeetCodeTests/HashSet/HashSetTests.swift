//
//  HashSetTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/29/25.
//

import XCTest


class MyHashSet {

    let buckets: [Bucket] =  Array(repeating: Bucket(), count: 769)

    init() {}

    func add(_ key: Int) {
       let index = hash(key)
        buckets[index].insert(key)
    }

    func remove(_ key: Int) {
       let index = hash(key)
        buckets[index].delete(key)
    }

    func contains(_ key: Int) -> Bool {
        let index = hash(key)
        return buckets[index].exits(key)
    }

    private func hash(_ key: Int) -> Int {
       return key % 769
    }
}

// TestHooks
extension MyHashSet {
    func getBucket(at index: Int) -> Bucket {
        return buckets[index]
    }

    func testTableHash(_ key: Int) -> Int {
        return hash(key)
    }

    func manuallyInsert(_ key: Int) {
        let index = hash(key)
        buckets[index].insert(key)
    }
}

class Bucket {
    private(set) var container: [Int] = []

    func insert(_ key: Int) {
        if !container.contains(key) {
            container.append(key)
        }
    }

    func delete(_ key: Int) {
        if let index = container.firstIndex(of: key) {
            container.remove(at: index)
        }
    }

    func exits(_ key: Int) -> Bool {
        return container.contains(key)
    }
}

class BucketTests: XCTestCase {
    // insert
    func testInsertAndExists() {
      // Assert
      let bucket = Bucket()
      // Act
      bucket.insert(10)
      // Assert
      XCTAssertEqual(bucket.container, [10])
    }

    func testInsertDuplicateDoesNotAddAgain() {
        // Arrange
        let bucket = Bucket()
        // Act
        bucket.insert(10)
        bucket.insert(10)
        // Assert
        XCTAssertEqual(bucket.container, [10])
    }

    func testMultipleUniqueInserts() {
        // Arrange
        let bucket = Bucket()
        // Act
        bucket.insert(1)
        bucket.insert(2)
        bucket.insert(3)
        // Assert
        XCTAssertEqual(bucket.container, [1, 2, 3])
    }

    // Delete
    func test_deleteExistingKey() {
        // Arrange
        let bucket = Bucket()
        // Act
        bucket.insert(24)
        bucket.delete(24)
        // Assert
        XCTAssertEqual(bucket.container, [])
    }

    func test_deletNonExistingKey() {
        // Arrange
        let bucket = Bucket()
        // Act
        bucket.insert(5)
        bucket.delete(8)
        // Assert
        XCTAssertEqual(bucket.container, [5])
    }

    func test_deleteFromEmptyBucket() {
        // Arrange
        let bucket = Bucket()
        // Act
        bucket.delete(10)
        // Assert
        XCTAssertEqual(bucket.container, [])
    }

    // Exits
    func test_exitsKeyInBucket() {
        // Arrange
        let bucket = Bucket()
        // Act
        bucket.insert(24)
        let doExists = bucket.exits(24)
        // Assert
        XCTAssertTrue(doExists)
    }

    func test_exitsNonExistingKey() {
        // Arrange
        let bucket = Bucket()
        // Act
        let doExists = bucket.exits(24)
        // Assert
        XCTAssertFalse(doExists)
    }
}

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
