//
//  BucketTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/29/25.
//
@testable import LeetCode
import XCTest

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

