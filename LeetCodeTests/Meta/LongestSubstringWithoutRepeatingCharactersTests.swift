//
//  LongestSubstringWithoutRepeatingCharactersTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/30/25.
//

@testable import LeetCode
import XCTest

final class LongestSubstringWithoutRepeatingCharactersTests: XCTestCase {
    func testIsUnique_withDuplicateCharacters_returns_false() {
        let sut = LongestSubstringWithoutRepeatingCharacter()
        let result: Bool = sut.isUnique(["a", "b", "a"])
        // Assert
        XCTAssertFalse(result)
    }

    func testIsUnique_withUniqueCharactets_returns_true() {
        // Arrange
        let sut = LongestSubstringWithoutRepeatingCharacter()
        let result = sut.isUnique(["a", "b", "c"])
        // Assert
        XCTAssertTrue(result)
    }

    func testLenghtOfLongestSubstring_withEmptyString_0() {
        // Arrange
        let sut = LongestSubstringWithoutRepeatingCharacter()
        // Assert
        XCTAssertEqual(sut.lenghtOfLongestSubstring(""), 0)
    }

    func testLenghtOfLongestSubstring_withAllRepeats_returns1() {
        // Arrange
        let sut = LongestSubstringWithoutRepeatingCharacter()
        // Assert
        XCTAssertEqual(sut.lenghtOfLongestSubstring("bbbbb"), 1)
    }

    func testLenghtOfLongestSubstring_withNoRepeat_returnsLenght() {
        // Arrange
        let sut = LongestSubstringWithoutRepeatingCharacter()
        // Assert
        XCTAssertEqual(sut.lenghtOfLongestSubstring("abcdefg"), 7)
    }
}
