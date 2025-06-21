//
//  AddBinary.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/17/25.
//

struct AddBinary {
    /// Adds two binary strings and returns the result as a binary string.
    ///
    ///  - Parameters:
    ///    - a: First binary string.
    ///    - b: Second binary string.
    ///  - Returns: Binary string result of a + b.
    func addBinary(_ a: String, _ b: String) -> String {
        var firsIndex = a.count - 1
        var secondIndex = b.count - 1
        var carry = 0
        var binarySumReversed = ""

        let firstDigits = Array(a)
        let secondDigits = Array(b)

        // Loop until both indices are done And there is not carry left.
        while firsIndex >= 0 || secondIndex >= 0 || carry > 0 {
            let firstBit = firsIndex >= 0 ? Int(String(firstDigits[firsIndex])) ?? 0 : 0
            let secondBit = secondIndex >= 0 ? Int(String(secondDigits[secondIndex])) ?? 0 : 0

            // Sum the bits plus any carry from previous step.
            let currentSum = firstBit + secondBit + carry

            // THe resulting bit is the remainder
            let currentBit = currentSum % 2

            // Update carry: if sum was 2 or 3, carry becomes 1; otherwise 0.
            carry = currentSum / 2

            // Append the bit to the result string (reversed order)
            binarySumReversed.append(String(currentBit))

            // Move both pointers left
            firsIndex -= 1
            secondIndex -= 1
        }
        return String(binarySumReversed.reversed())
    }
}
