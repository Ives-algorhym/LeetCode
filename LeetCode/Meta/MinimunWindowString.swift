//
//  MinimunWindowString.swift
//  LeetCode
//
//  Created by Ives Murillo on 6/23/25.
//

func minWindow(_ s: String, _ t: String) -> String {
    guard !s.isEmpty &&  !t.isEmpty else { return "" }

    var dictT = [Character: Int]()
    for char in t {
        dictT[char, default: 0] += 1
    }

    let required = dictT.count
    var formed = 0
    var windowCounts = [Character: Int]()

    var l = s.startIndex
    var r = s.startIndex

    var ans: (length: Int, left: String.Index, rigth: String.Index)? = nil

    while r < s.endIndex {
        let char = s[r]
        windowCounts[char, default: 0] += 1

        if let need = dictT[char], windowCounts[char] == need {
            formed += 1
        }

        while formed == required {
            if let currentAns = ans {
                if s.distance(from: l, to: r) + 1 < currentAns.length {
                    ans = (s.distance(from: l, to: r) + 1, l, r)
                }
            } else {
                ans = (s.distance( from: l, to: r) + 1, l, r)
            }

            let leftChar = s[l]
            windowCounts[leftChar]! -= 1
            if let need = dictT[leftChar], windowCounts[leftChar]! < need {
                formed -= 1
            }

            l = s.index(after: l)
        }

        r = s.index(after: r)
    }

    if let ans = ans {
        return String(s[ans.left...ans.rigth])
    } else {
        return ""
    }
}
