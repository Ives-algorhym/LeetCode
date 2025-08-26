//
//  HappyNumber.swift
//  LeetCode
//
//  Created by Ives Murillo on 8/25/25.
//

final class HappyNumber {
    private func squareSum(_ n: Int) -> Int{
        var x = n
        var sum = 0
        while x > 0 {
            let digit = x % 10
            sum += digit &* digit
            x /= 10
        }
        return sum
    }

    func isHappy(_ n: Int) -> Bool {
        if n == 1 { return true }
        var x = n
        var seen = Set<Int>()
        while x != 1 && !seen.contains(x) {
            seen.insert(x)
            x = squareSum(x)
        }
        return x == 1
    }
}

