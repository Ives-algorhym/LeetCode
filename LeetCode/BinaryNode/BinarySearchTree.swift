//
//  BinarySearchTree.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/27/25.
//

final class BinarySearchTree<T> {
    private var root: BinaryNode<T>?
}

extension BinarySearchTree {
    public var testHooks: TestHooks {
        return TestHooks(target: self)
    }
    struct TestHooks {
        private let target: BinarySearchTree

        fileprivate init(target: BinarySearchTree) {
            self.target = target
        }

        var root: BinaryNode<T>? {
            target.root
        }
    }
}
