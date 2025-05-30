//
//  Bucket.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/29/25.
//

class Bucket {
    private(set) var container: [Int] = []

    func insert(_ key: Int) {
        if !container.contains(key) {
            container.append(key)
        }
    }

    func delete(_ key: Int) {
        if let index = container.firstIndex(of: key) {
            container.remove(at: index)
        }
    }

    func exits(_ key: Int) -> Bool {
        return container.contains(key)
    }
}
