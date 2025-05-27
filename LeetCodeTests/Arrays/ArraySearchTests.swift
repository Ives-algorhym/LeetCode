//
//  ArraySearchTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 2/18/25.
//

//public static boolean linearSearch(int[] array, int length, int element) {
//    // Check for edge cases. Is the array null or empty?
//    // If it is, then we return false because the element we're
//    // searching for couldn't possibly be in it.
//    if (array == null || length == 0) {
//        return false;
//    }
//
//    // Carry out the linear search by checking each element,
//    // starting from the first one.
//    for (int i = 0; i < length; i++) {
//        // We found the element at index i.
//        // So we return true to say it exists.
//        if (array[i] == element) {
//            return true;
//        }
//    }
//
//    // We didn't find the element in the array.
//    return false;
//}
import Foundation
import XCTest

final class LinearSearch {
    func linearSearch(array: [Int],length: Int,element: Int) -> Bool {
        if array.isEmpty || length == 0 {
            return false
        }

        for i in 0..<length {
            if array[i] == element {
                return true
            }
        }

        return false
    }
    // create a binary search

}

final class ArraySearchTests: XCTestCase {
    func test_arraySearch() {
        // Arrange
        let sut = LinearSearch()
        // Act
        let result = sut.linearSearch(array: [3,4,2], length: 3, element: 2)
        // Assert
        XCTAssertTrue(result)
    }
}
