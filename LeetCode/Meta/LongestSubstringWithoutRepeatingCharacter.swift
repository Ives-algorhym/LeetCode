//
//  LongestSubstringWithoutRepeatingCharacter.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/30/25.
//

final class LongestSubstringWithoutRepeatingCharacter {

    func lenghtOfLongestSubstringBruteForceArray(_ string: String) -> Int {
        let characters = Array(string)
        let count = characters.count
        var maxLenght = 0

        for startIndex in 0..<count {
            for endIndex in startIndex + 1...count {
                let subString = Array(characters[startIndex..<endIndex])
                if isUnique(subString) {
                    maxLenght = max(maxLenght, endIndex - startIndex)
                }
            }
        }

        return maxLenght
    }

    func lenghtOfLongestSubstringBruteForceDictionary(_ string: String) -> Int {

        var charCounts: [Character: Int] = [:]
        var left = string.startIndex
        var maxLenght = 0

        var right = string.startIndex

        while right < string.endIndex {
            let char = string[right]
            charCounts[char, default: 0] += 1

            while charCounts[char, default: 0] > 1 {
                let leftChar = string[left]
                charCounts[leftChar, default: 0] -= 1
                left = string.index(after: left)
            }

            maxLenght = max(maxLenght, string.distance(from: left, to: string.index(after: right)))

            right = string.index(after: right)
        }

        return maxLenght
    }
    func lenghtOfLongestSubstringSet(_ string: String) -> Int {

        var seen: Set<Character> = []
        var left = string.startIndex
        var maxLenght = 0
        var right = string.startIndex

        while right < string.endIndex {
            let char = string[right]

            while seen.contains(char){
                seen.remove(string[left])
                left = string.index(after: left)
            }

            seen.insert(char)
            maxLenght = max(
                maxLenght,
                string.distance(from: left, to: string.index(after: right))
            )
            right = string.index(after: right)
        }

        return maxLenght
    }

    func lenghtOfLongestSubstringOptimize(_ string: String) -> Int {

        var charToNextIndex: [Character: Int] = [:]
        var maxLength = 0
        var start = 0
        let characters = Array(string)

        for (end, char) in characters.enumerated() {
            if let nextIndex = charToNextIndex[char], nextIndex > start {
                start = nextIndex
            }

            maxLength = max(maxLength, end - start + 1)
            charToNextIndex[char] = end + 1
        }

        return maxLength
    }

    func lenghtOfLongestSubstring(_ string: String) -> Int {
        var charToLastSeenIndex: [Character: String.Index] = [:]
        var maxLength = 0
        var start = string.startIndex

        var end = start
        while end < string.endIndex {
            let char = string[end]

            if let lastSeen = charToLastSeenIndex[char], lastSeen >= start {
                start = string.index(after: lastSeen)
            }

            let length = string.distance(from: start, to: string.index(after: end))
            maxLength = max(maxLength, length)

            charToLastSeenIndex[char] = end
            end = string.index(after: end)
        }

        return maxLength
    }

    func isUnique(_ chars: [Character]) -> Bool {
        var seen = Set<Character>()
        for char in chars {
            if seen.contains(char) {
                return false
            }
            seen.insert(char)
        }
        return true
    }
}
