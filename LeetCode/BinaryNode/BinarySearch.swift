//
//  BinarySearch.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/29/25.
//

public extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>?) -> Index? {
        let range = range ?? startIndex..<endIndex

        guard range.lowerBound < range.upperBound else {
            return nil
        }

        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size/2)

        if self[middle] == value {
            return middle
        }

        else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after:middle)..<range.upperBound)
        }
    }
}
