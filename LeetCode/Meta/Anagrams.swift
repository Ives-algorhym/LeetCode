//
//  Anagrams.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/23/25.
//

    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        var map = [String: [String]]()
//
//        for str in strs {
//            let key = String(str.sorted())
//            map[key, default: []].append(str)
//        }
//        return Array(map.values)
        Dictionary(grouping: strs) { String($0.sorted()) }
            .map(\.value)
    }
