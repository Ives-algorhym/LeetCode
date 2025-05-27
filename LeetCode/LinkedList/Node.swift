//
//  Node.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/24/25.
//


final class Node<Value>{
    var value: Value
    var next: Node?
    var previous: Node?

    init(
        value: Value,
        next: Node? = nil,
        previous: Node? = nil
    ) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

extension Node: Equatable {
    static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        lhs === rhs
    }


}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next)
    }
}