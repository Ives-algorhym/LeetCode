//
//  StringToInt.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/2/25.
//

struct StringToInt {
    func myAtoi(_ input: String) -> Int {

        var index = input.startIndex
        let end = input.endIndex
        var sign = 1
        var result = 0

        // Constants
        let INT_MAX = Int(Int32.max)
        let INT_MIN = Int(Int32.min)

        // 1. Skip leading spaces
        while index < end, input[index] == " " {
            index = input.index (after: index)
        }

        // 2. handle sign
        if index < end {
            if input[index] == "+" {
                sign = 1
                index = input.index(after: index)
            } else if input[index] == "-" {
                sign = -1
                index = input.index(after: index)
            }
        }

        // 3. Parse digits and handle overflow
        while index < end, let digit = input[index].wholeNumberValue {
            if result > INT_MAX / 10 || (result == INT_MAX && digit > INT_MAX % 10) {
                return sign == 1 ? INT_MAX : INT_MIN
            }

            result = result * 10 + digit
            index = input.index(after: index)

        }
        return sign * result
    }
}
