//
//  BinaryNode.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/26/25.
//

final class BinaryNode<T> {
    let value: T
    var rightChild: BinaryNode?
    var leftChild: BinaryNode?

    init(value: T) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    

    private func diagram(
        for node: BinaryNode?,
        _ top: String = "",
        _ root: String = "",
        _ bottom: String = ""
    ) -> String {
        guard let node else {
            return root + "nil\n"
        }

        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }

        return diagram(for: node.rightChild,
                       top + "    ",
                       top + "┌──",
                       top + "│   ")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild,
                  bottom + "│   ",
                  bottom + "└──",
                  bottom + "    ")
    }
}

extension BinaryNode {
    func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }

    func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }

    func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
