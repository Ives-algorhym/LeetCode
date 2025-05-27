//
//  LinkedList.swift
//  LeetCodeTests
//
//  Created by Ives Murillo on 5/1/25.
//

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?

    var isEmpty: Bool {
        head == nil
    }

    mutating func push(_ value: Value) {
        let newNode = Node(value: value, next: head)
        head?.previous = newNode
        head = newNode
        if tail == nil {
            tail = head
        }
    }

    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        let newNode = Node(value: value, previous: tail)
        tail?.next = newNode
        tail = newNode
    }

    func getNode(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }

    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }

        let newNode = Node(value: value, next: node.next, previous: node)
        node.next = newNode
        node.next?.previous = newNode

        return newNode
    }

    @discardableResult
    mutating func pop() -> Value? {

        let value = head?.value

        let oldHead = head
        head = head?.next
        oldHead?.next = nil
        head?.previous = nil

        if head == nil {
            tail = nil
        }
        return value
    }

    mutating func removeLast() -> Value? {
        guard let head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }

        let removedValue = tail?.value
        tail = tail?.previous
        tail?.next = nil

        return removedValue
    }

    mutating func removeAfter(_ node: Node<Value>) -> Value? {
        let removedValue = node.next?.value
        let nextOfRemoved = node.next?.next
        node.next = nextOfRemoved
        node.next?.previous = node

        if node.next === tail {
            tail = node
        }
        return removedValue
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head else {
            return ""
        }

        return String(describing: head)
    }
}


