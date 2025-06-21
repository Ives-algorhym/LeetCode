//
//  MultiplyStrings.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/19/25.
//

final class MultiplyStrings {
    func multiplyOneDigit(_ firstNumber: String, _ secondDigit: Character, _ numZeros: Int) -> [Int] {
        var result = Array(repeating: 0, count: numZeros)
        var carry = 0

        for digitChar in firstNumber {
            let product = (secondDigit.wholeNumberValue ?? 0) * (
                digitChar.wholeNumberValue ?? 0
            ) + carry
            result.append(product % 10)
            carry = product / 10
        }

        if carry > 0 {
            result.append(carry)
        }

        return result
    }

    func sumResults(_ results: inout [[Int]]) -> String {
        var answer = results.removeLast()

        for result in results {
            var newAnswer: [Int] = []
            var carry = 0
            let maxLength = max(answer.count, result.count)

            for i in 0..<maxLength {
                let digit1 = i < result.count ? result[i] : 0
                let digit2 = i < answer.count ? answer[i] : 0
                let total = digit1 + digit2 + carry
                newAnswer.append(total % 10)
                carry = total / 10
            }

            if carry > 0 {
                newAnswer.append(carry)
            }

            answer = newAnswer
        }

        return answer.map(String.init).joined()
    }

    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }

        let firstReversed = String(num1.reversed())
        let secondReversed = String(num2.reversed())

        var results: [[Int]] = []

        for (i, digit) in secondReversed.enumerated() {
           let product = multiplyOneDigit(firstReversed, digit, i)
            results.append(product)
        }

        var answer = sumResults(&results)
        return String(answer.reversed())
    }
}
