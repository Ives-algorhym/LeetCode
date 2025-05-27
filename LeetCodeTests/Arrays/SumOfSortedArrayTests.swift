//
//  SumOfSortedArrayTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 2/6/25.
//

import Foundation
import XCTest

class SumOfSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // Make a copy of the first m elements of nums1.
        let nums1Copy = Array(nums1[0..<m])
        // Read pointers for nums1Copy and nums2 respectively.
        var p1 = 0
        var p2 = 0
        // Compare elements from nums1Copy and nums2 and write the smallest to nums1.
        for p in 0..<(nums1.count) {
            // Ensure p1 and p2 are within the bounds of their respective arrays.
            if p2 >= nums2.count || (p1 < nums1Copy.count && nums1Copy[p1] < nums2[p2]) {
                nums1[p] = nums1Copy[p1]
                p1 += 1
            } else {
                nums1[p] = nums2[p2]
                p2 += 1
            }
        }
    }

    func merge_Optimized(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // Set p1 and p2 to point to the end of their respective arrays.
        var p1 = m - 1
        var p2 = n - 1
        // Set p to point to the end of nums1.
        var p = m + n - 1

        // Move p backward through nums1, each time writing the largest value
        // pointed at by p1 or p2.
        while p >= 0 {
            if p2 < 0 {
                break // All elements from nums2 are merged, so we can stop.
            }
            if p1 >= 0 && nums1[p1] > nums2[p2] {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
            p -= 1
        }
    }
}

class SumOfSortedArrayTests: XCTestCase {

    func test_merge() {
        var nums1 = [1,2,3,0,0,0]
        let sut = SumOfSortedArray()
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        sut.merge(&nums1, m, nums2, n)
        XCTAssertEqual(nums1, [1,2,2,3,5,6])
    }
}
