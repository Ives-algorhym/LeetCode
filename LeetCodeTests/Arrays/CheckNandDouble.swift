//
//  Untitled.swift
//  LeetCode
//
//  Created by Ives Murillo on 3/8/25.
//

import XCTest

final class CheckNandDouble {
    func checkIfExist(_ arr: [Int]) -> Bool {
        // Step 1: Iterate through all pairs of indices
        for i in 0..<arr.count {
            for j in 0..<arr.count {
                // Step 2: Check the conditions
                if i != j && arr[i] == 2 * arr[j] {
                    return true
                }
            }
        }
        return false
    }

    func checkIfExistOptimal(_ arr: [Int]) -> Bool {
        var seen: Set<Int> = []

        for num in arr {
            if seen.contains(num * 2) || seen.contains(num / 2) {
                return true
            }
            seen.insert(num)
        }
       return false
    }

    func checkIfExistBinary(_ arr: [Int]) -> Bool {
        // Step 1: Sort the array
        let sortedArr =  arr.sorted()

        for i in 0..<sortedArr.count {
            // Step 2: Calculate the target (double of current number)
            let target = sortedArr[i] * 2
            // Step 3: Custom binary search for the target
            let index = customBinarySearch(sortedArr, target)
            // If the target exists and is not the same index
            if index >= 0 && index != i {
                return true
            }
        }
        return false
    }

    private func customBinarySearch(_ arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count - 1

        while left <= right {
            let mid = left + (right - left) / 2

            if arr[mid] == target {
                return mid
            } else if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return -1
    }

    func checkIfExistHashMap(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()

        // count the ocurrences of each number
        for num in arr {
            map[num, default: 0] += 1
        }

        for num in arr {
            // Check for double
            if num != 0, map[2 * num] != nil {
                return true
            }
            // Handle zero case (ensure there are at least two zeros)
            if num == 0, let count = map[num], count > 1 {
                return true
            }
        }
        return false
    }

    func checkIfExistSet(_ arr: [Int]) -> Bool {
        var set = Set<Int>()

        for num in arr {
            if set.contains(2 * num) || (num % 2 == 0 && set.contains(num / 2)) {
                return true
            }
            set.insert(num)
        }
        return false
    }
}

final class CheckNandDoubleTests: XCTestCase {
    func test_checkIfExist() {
        // Arrange
        let sut = CheckNandDouble()

        // Act
        let checkIfExist = sut.checkIfExist([10,2,5,3])

        // Assert
        XCTAssertTrue(checkIfExist)
    }

    func test_checkIfExistOptimal() {
        // Arrange
        let sut = CheckNandDouble()

        // Act
        let checkIfExist = sut.checkIfExistOptimal([10,2,5,3])

        // Assert
        XCTAssertTrue(checkIfExist)
    }

    func test_sorting_binarySearch() {
        // Arrange
        let sut = CheckNandDouble()

        // Act
        let checkIfExist = sut.checkIfExistBinary([10,2,5,3])

        // Assert
        XCTAssertTrue(checkIfExist)
    }

    func test_hashMap() {
        // Arrange
        let sut = CheckNandDouble()

        // Act
        let checkIfExist = sut.checkIfExistHashMap([10,2,5,3])

        // Assert
        XCTAssertTrue(checkIfExist)
    }

    func test_checkIfExistSet() {
        // Arrange
        let sut = CheckNandDouble()

        // Act
        let checkIfExist = sut.checkIfExistSet([10,2,5,3])

        // Assert
        XCTAssertTrue(checkIfExist)
    }
}
