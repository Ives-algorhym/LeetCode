//
//  Untitled.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/6/25.
//

struct StringToIntStateMachine {
    func myAtoi(_ string: String) -> Int {
        let machine = StateMachine()
        for char in string {
            if machine.getState() == .invalid {
                break
            }
            machine.transition(char)
        }
        return machine.getInteger()
    }
}

enum State {
    case start, signed, inNumber, invalid
}

final class StateMachine {
    private var state: State = .start
    private var sign = 1
    private var result: Int = 0

    let INT_MAX = Int(Int32.max)
    let INT_MIN = Int(Int32.min)

    func getState() -> State {
        return state
    }

    func getInteger() -> Int {
        return result * sign
    }

    private func buildNumber(add digit: Int) {
        if result > INT_MAX / 10 || (result == INT_MAX / 10 && digit > INT_MAX % 10) {
            result = sign == 1 ? INT_MAX : INT_MIN
            sign = 1
            state = .invalid
        } else {
            result = result * 10 + digit
        }
    }

    func transition(_ char: Character) {
        switch state {
        case .start:
            if char == " " {
                return
            } else if char == "-" {
                state = .signed
                sign = -1
            } else if char == "+" {
                state = .signed
                sign = 1
            } else if let digit = char.wholeNumberValue {
                state = .inNumber
                buildNumber(add: digit)
            } else {
                state = .invalid
                result = 0
                return
            }


        case .signed, .inNumber:
            if let digit = char.wholeNumberValue {
                state = .inNumber
                buildNumber(add: digit)
            } else {
                state = .invalid
            }
        case .invalid:
            return
        }
    }

}
