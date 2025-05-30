//
//  HashSet.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/29/25.
//

class MyHashSet {

    let buckets: [Bucket] =  Array(repeating: Bucket(), count: 769)

    init() {}

    func add(_ key: Int) {
       let index = hash(key)
        buckets[index].insert(key)
    }

    func remove(_ key: Int) {
       let index = hash(key)
        buckets[index].delete(key)
    }

    func contains(_ key: Int) -> Bool {
        let index = hash(key)
        return buckets[index].exits(key)
    }

    private func hash(_ key: Int) -> Int {
       return key % 769
    }
}

// TestHooks
extension MyHashSet {
    func getBucket(at index: Int) -> Bucket {
        return buckets[index]
    }

    func testTableHash(_ key: Int) -> Int {
        return hash(key)
    }

    func manuallyInsert(_ key: Int) {
        let index = hash(key)
        buckets[index].insert(key)
    }
}
