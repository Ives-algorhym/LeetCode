//
//  AddString.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/18/25.
//

struct AddString {
    func addString(_ num1: String, _ num2: String) -> String {
        var result = ""
        var carry = 0
        let digitsOne = Array(num1)
        let digitsTwo = Array(num2)

        var indexOne = digitsOne.count - 1
        var indexTwo = digitsTwo.count - 1

        while indexOne >= 0 || indexTwo >= 0 || carry > 0 {
            let digitOne = indexOne >= 0 ? Int(String(digitsOne[indexOne])) ?? 0 : 0
            let digitTwo = indexTwo >= 0 ? Int(String(digitsTwo[indexTwo])) ?? 0 : 0

            let sum = digitOne + digitTwo + carry
            let currentDigit = sum % 10
            carry = sum / 10

            result.append(Character(String(currentDigit)))

            indexOne -= 1
            indexTwo -= 1
        }
        return String(result.reversed())
    }
}
