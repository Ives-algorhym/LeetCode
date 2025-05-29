//
//  BinarySearchTree.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/27/25.
//

struct BinarySearchTree<T: Comparable> {
    private var root: BinaryNode<T>?

    mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
   }

    func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        guard let node else {
            return BinaryNode(value: value)
        }

        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }

        return node
    }

    func contains(_ value: T) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }

            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }

    mutating func remove(_ value: T) {
        root = remove(node: root, value)
    }
    func remove(node: BinaryNode<T>?, _ value: T) -> BinaryNode<T>? {
        guard let node else {
            return nil
        }

        if value == node.value {
            // 1
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }

            // 2
            if node.leftChild == nil {
                return node.rightChild
            }

            // 3
            if node.rightChild == nil {
                return node.leftChild
            }

            // 4
            if let successor = node.rightChild?.min {
                node.value = successor.value
                node.rightChild = remove(node: node.rightChild, value)
            }


        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value)
        } else {
            node.rightChild = remove(node: node.rightChild,value)
        }
        return node
    }
}

extension BinarySearchTree {
    public var description: String {
        return root?.description ?? "empty tree"
    }
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
