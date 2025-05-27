//
//  Tree.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/12/25.
//

@testable import LeetCode
import XCTest

final class TreeNodeTests: XCTestCase {
    var sut: TreeNode<Int>!

    override func setUp() {
        sut = TreeNode(24)
    }

    override func tearDown() {
        sut = nil
    }

    func test_init() {
        // Assert
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.value)
        XCTAssertNotNil(sut.children)
    }

    func test_add_shouldAddNodeToChildrenArray() {
        // Arrange
        let childNode = TreeNode(2)
        // Act
        sut.add(childNode)
        // Assert
        XCTAssertTrue(sut.children.contains{ $0 === childNode })
    }

    func test_forEachDepthFirst_shoulTraverseNode() {
        let tree = TreeNode("Beverage")
        let hot = TreeNode("Hot")
        let cold = TreeNode("Cold")

        let tea = TreeNode("Tea")
        let coffe = TreeNode("Coffe")
        let chocolate = TreeNode("Chocolate")

        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")

        let soda = TreeNode("soda")
        let milk = TreeNode("milk")

        let gingerAle = TreeNode("ginger Ale")
        let bitterLemon = TreeNode("bitter lemon")

        tree.add(hot)
        tree.add(cold)

        hot.add(tea)
        hot.add(coffe)
        hot.add(chocolate)

        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)

        cold.add(soda)
        cold.add(milk)

        soda.add(gingerAle)
        soda.add(bitterLemon)


        var visitedValues: [String] = []
        // Act
       tree.forEachDepthFirst{ node in
            visitedValues.append(node.value)
        }
        // Assert
        XCTAssertEqual(
            visitedValues,
            [
                "Beverage", 
                "Hot",
                "Tea",
                "black",
                "green",
                "chai",
                "Coffe",
                "Chocolate",
                "Cold",
                "soda",
                "ginger Ale",
                "bitter lemon",
                "milk"
            ]
        )
    }

    func test_forEachLevelOrder() {
        let tree = TreeNode("Beverages")
        let hot = TreeNode("Hot")
        let cold = TreeNode("Cold")

        let tea = TreeNode("Tea")
        let coffe = TreeNode("Coffee")
        let chocolate = TreeNode("Chocolate")

        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")

        let soda = TreeNode("soda")
        let milk = TreeNode("milk")

        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")

        tree.add(hot)
        tree.add(cold)

        hot.add(tea)
        hot.add(coffe)
        hot.add(chocolate)

        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)

        cold.add(soda)
        cold.add(milk)

        soda.add(gingerAle)
        soda.add(bitterLemon)


        var visitedValues: [String] = []
        // Act
        tree.forEachLevelOrder { node in
            visitedValues.append(node.value)
        }

        // Assert
        XCTAssertEqual(visitedValues, [
            "Beverages",
            "Hot",
            "Cold",
            "Tea",
            "Coffee",
            "Chocolate",
            "soda",
            "milk",
            "black",
            "green",
            "chai",
            "ginger ale",
            "bitter lemon"
        ])
    }

    func test_searchSholdReturnValueIfIsInQueue() {
        // Arrange
        let nodeToSearch = TreeNode(5)
        sut.add(nodeToSearch)
        // Act
        let value = sut.search(5)
        // Assert
        XCTAssertEqual(value?.value,5)
    }
}
