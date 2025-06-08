//
//  StringToInt.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/2/25.
//

struct StringToInt {
    func myAtoi(_ s: String) -> Int {

        var index = s.startIndex
        let end = s.endIndex
        var sign = 1
        var result = 0

        // Constants
        let INT_MAX = Int(Int32.max)
        let INT_MIN = Int(Int32.min)

        // 1. Skip leading spaces
        while index < end, s[index] == " " {
            index = s.index (after: index)
        }

        // 2. handle sign
        if index < end {
            if s[index] == "+" {
                sign = 1
                index = s.index(after: index)
            } else if s[index] == "-" {
                sign = -1
                index = s.index(after: index)
            }
        }

        // 3. Parse digits and handle overflow
        while index < end, let digit = s[index].wholeNumberValue {
            if result > INT_MAX / 10 || (result == INT_MAX/10 && digit > INT_MAX % 10) {
                return sign == 1 ? INT_MAX : INT_MIN
            }

            result = result * 10 + digit
            index = s.index(after: index)

        }
        return sign * result
    }
}
