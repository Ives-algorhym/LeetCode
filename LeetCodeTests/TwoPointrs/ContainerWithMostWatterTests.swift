//
//  ContainerWithMostWatterTests.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 4/19/25.
//

import XCTest

struct ContainerWithMostWatter {
    func checkContainer(_ heigths: [Int]) -> Int {
        var maxWatter = 0 // Keeps track of maximun area found O(1)
        var left = 0      // left pointer starts at beginning  O(1)
        var rigth = heigths.count - 1  // Rigth pointer starts at end  O(1)

        while left < rigth {  // Continue while pointers haven't crossed  O(n/2)
            // Calculate current area
            let width = rigth - left // Current width
            let containerHeigth = max(heigths[left], heigths[rigth]) // Heigth is the minimun of the two of them
            let area = width * containerHeigth

            maxWatter = max(maxWatter, area) // Update the maximun area

            // Move pointers
            if heigths[left] < heigths[rigth] {
                left += 1 // Move left pointer right
            } else {
                rigth -= 1 // Move right pointer left
            }
        }
        return maxWatter
    }

}
final class ContainerWithMostWatterTests: XCTestCase {
    func test_checkContainer() {
        // Arrange
        let sut = ContainerWithMostWatter()
        let heigths = [3, 8, 6, 2, 9, 4, 7, 3, 2]
        // Act
        let maxWatterr = sut.checkContainer(heigths)
        // Assert
        XCTAssertEqual(maxWatterr, 42)
    }
}
