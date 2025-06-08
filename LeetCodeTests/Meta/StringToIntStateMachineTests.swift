//
//  StringToIntStateMachineTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 6/6/25.
//

@testable import LeetCode
import XCTest

final class StringToIntStateMachineTests: XCTestCase {

    var sut: StringToIntStateMachine!

    override func setUp() {
        sut = StringToIntStateMachine()
    }

    override func tearDown() {
        sut = nil
    }

    func test_myAtoiWithEmptyString_shouldReturnZero() {
        // Arrange
        sut = StringToIntStateMachine()
        // Act
        let result = sut.myAtoi("")
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_myAtoiWithEmptySpacesString_shouldReturnZero() {
        // Act
        let result = sut.myAtoi("     ")
        // Assert
        XCTAssertEqual(result, 0)
    }

    func test_myAtoiWithDigits_shouldReturnInt() {
        // Act
        let result = sut.myAtoi("42")
        // Assert
        XCTAssertEqual(result, 42)
    }

    func test_myAtoi_withTrailingCharacters_shouldStopParsing() {
        // Act
        let result = sut.myAtoi("4193 with words")
        // Assert
        XCTAssertEqual(result, 4193)
    }

    func test_myAtoi_withLeadingCharacters_shouldReturn0() {
       // Act
        let result = sut.myAtoi("with words 4292")
        // Assert
        XCTAssertEqual(result, 0)
    }


    func test_myAtoi_withOnlySign_shouldReturnZero() {
       // Act
        let result = sut.myAtoi("-")
        // Assert
        XCTAssertEqual(result, 0)
    }
}

final class StateMachineTest: XCTestCase {

    var sut: StateMachine!

    override func setUp() {
        sut = StateMachine()
    }

    override func tearDown() {
        sut = nil
    }

    func test_initialState_shouldBe_start() {
        // Act
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .start)
    }

    func test_transition_withWhiteSpaceFromStart_shouldStayInStart() {
        // Act
        sut.transition(" ")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .start)
    }

    func test_transition_withWhiteSpaceFromSigned_shouldGoToInvalid() {
        // Arrange
        sut.transition("-")
        // Act
        sut.transition(" ")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .invalid)
    }

    func test_transition_withWhiteSpaceFromInNumber_shouldGoToInvalid() {
        // Arrange
        sut.transition("1")
        // Act
        sut.transition(" ")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .invalid)
    }

    func test_transition_withSignFromStart_shouldGoSigned() {
        // Act
        sut.transition("-")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .signed)
    }

    func test_transition_withSignFromInNumber_shouldGoInvalid() {
        // Arrange
        sut.transition("1")

        sut.transition("-")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .invalid)
    }

    func test_transition_withDigitFromStart_shouldGo_inNumber() {
        // Act
        sut.transition("2")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(state, .inNumber)
    }

    func test_transition_withMultipleDigits_shouldAcomulateInResult() {
        // Act
        sut.transition("1")
        sut.transition("2")
        sut.transition("3")
        let state = sut.getState()
        // Assert
        XCTAssertEqual(sut.getInteger(), 123)
        XCTAssertEqual(state, .inNumber)
    }

    func test_transitionWithMinus_signReturnNegativeInt() {
        // Arrange
        sut.transition("-")
        sut.transition("1")
        // Act
        let result = sut.getInteger()
        // Assert
        XCTAssertEqual(result, -1)
    }

    func test_transitionWithPlus_signReturnPositiveInt() {
        // Arrange
        sut.transition("+")
        sut.transition("1")
        // Act
        let result = sut.getInteger()
        // Assert
        XCTAssertEqual(result, 1)
    }

    func test_transitionWithNoSign_returnPositiveInt() {
        // Arrange
        sut.transition("1")
        // Act
        let result = sut.getInteger()
        // Assert
        XCTAssertEqual(result, 1)
    }

    func test_transition_whenOverflow_shouldClampToInt32Max() {
        // Arrange
        for char in "2147483648" {
            sut.transition(char)
        }

        // Act
        let number = sut.getInteger()
        // Assert
        XCTAssertEqual(number, Int(Int32.max))
    }

    func test_transition_whenUnderflow_shouldClampToInt32Min() {
        // Arrange
        sut.transition("-")
        for char in "2147483648" {
            sut.transition(char)
        }
        // Act
        let number = sut.getInteger()
        // Assert
        XCTAssertEqual(number, Int(Int32.min))
    }
}
