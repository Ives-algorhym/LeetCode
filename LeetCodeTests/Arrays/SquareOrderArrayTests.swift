//
//  SquareOrderArrayTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 1/25/25.
//

import Foundation
import XCTest

class SquareOrderArray {
    func sortedSquares(_ nums: [Int]) -> [Int] {
//        nums.map {
//            $0 * $0
//        }.sorted()


        var result = [Int](repeating: 0, count: nums.count)
              var left = 0
              var right = nums.count - 1
              var index = nums.count - 1

              while left <= right {
                  let leftSquare = nums[left] * nums[left]
                  let rightSquare = nums[right] * nums[right]

                  if leftSquare > rightSquare {
                      result[index] = leftSquare
                      left += 1
                  } else {
                      result[index] = rightSquare
                      right -= 1
                  }
                  index -= 1
              }

              return result
    }
}

final class SquareOrderArrayTests: XCTestCase {
    func test_sortedSquares() {
        let sut = SquareOrderArray()
        let nums = [-4,-1,0,3,10]
        let result = sut.sortedSquares(nums)

        XCTAssertEqual(result, [0,1,9,16,100])
    }
}
