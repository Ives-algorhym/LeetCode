//
//  AnagramsTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/20/25.
//

@testable import LeetCode
import XCTest

final class AnagramsTests: XCTestCase {

    func test_groupAnagrams() {
        // Arrange
        let input = ["bat"]
        // Act
        let result = groupAnagrams(input)
        // Assert
        XCTAssertEqual(result, [["bat"]])
    }

    func test_multipleAnagramGroup_returnedGroupedAnagrams() {
        // Arrange
        let input = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let result = groupAnagrams(input)
        // Assert
        XCTAssertEqual(result.count, 3)

        XCTAssertTrue(result.contains { group in
            group.contains("eat") && group.contains("tea") && group.contains("ate")
        })

        XCTAssertTrue(result.contains { group in
            group.contains("tan") && group.contains("nat")
        })

        XCTAssertTrue(result.contains { group in
            group == ["bat"]
        })
    }
}
