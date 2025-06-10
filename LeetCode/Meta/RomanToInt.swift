//
//  RomonToInt.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/9/25.
//

struct RomanToInt {

    func romanToIntBruteForce(_ string: String) -> Int {
        let values: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        let chars = Array(string)
        var sum = 0
        var i = 0

        while i < chars.count {
            let current = values[chars[i]] ?? 0
            let next = (i + 1 < chars.count) ? (values[chars[i + 1]] ?? 0) : 0

            if current < next {
                sum += (next - current)
                i += 2
            } else {
                sum += current
                i += 1
            }
        }
        return sum
    }

    func romanToInt(_ string: String) -> Int {
        let values: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        var total = 0
        var previousValue = 0

        for char in string.reversed() {
            let value = values[char, default: 0]

            if  value < previousValue {
                total -= value
            } else {
                total += value
            }

            previousValue = value
        }
        return total
    }

}
