//
//  Queues.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/24/25.
//


protocol Queues {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct QueueArray<T>: Queues {
    var array: [T] = []
    var isEmpty: Bool {
        array.isEmpty
    }
    var peek: T? {
        array.first
    }

    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}
