# LeetCode Solutions in Swift

This repository contains my personal solutions to selected [LeetCode](https://leetcode.com) problems implemented in Swift. Each solution is written with clean architecture principles in mind and includes unit tests using XCTest.

## 🧠 What’s Inside

- ✅ Data Structures: Linked Lists, Trees, Graphs, Queues, Stacks
- 🔄 Algorithms: Sorting, Recursion, BFS, DFS, Dynamic Programming
- 🧪 Test-Driven Development: All code is covered by XCTest unit tests
- 🛠 Organized by topic, with dedicated folders per concept

## 📁 Project Structure
LeetCode/
├── LinkedList/
│   └── LinkedList.swift
├── TreeNode/
│   ├── TreeNode.swift
│   └── TreeNodeTests.swift
├── Sorting/
│   └── BubbleSort.swift
├── Utilities/
│   └── Queue.swift
├── LeetCodeTests/
│   └── TreeNodeTests.swift
└── README.md

🚧 Work In Progress

This is an evolving project. I’m continuously adding:
	•	More problems and solutions
	•	More structured unit tests
	•	Benchmarking and performance analysis

📚 Goals
	•	Practice algorithmic problem-solving in Swift
	•	Master Test-Driven Development (TDD)
 	•	Prepare for iOS software engineering interviews (e.g., Meta, Apple, Amazon)

🧑‍💻 Author

Ives Murillo
iOS Software Engineer • Passionate about clean code, TDD, and system design




🧠 Two Pointers Technique: Master Checklist & Swift Examples

✅ Purpose

Use this as a professional-grade guide to master and apply the Two Pointers technique, whether preparing for interviews or writing production-quality iOS code.

🚀 Checklist: Solving Problems with Two Pointers

1. Understand the Problem Type

Are you finding a pair, triplet, window, or partition?

Common scenarios:

Sum equals target (e.g. 2Sum, 3Sum)

Maximizing or minimizing value (e.g. container with most water)

Detecting duplicates or palindromes

Linked list problems (e.g. cycle detection)

2. Is Sorting Required?

Many two-pointer problems require sorted input.

Add let sorted = nums.sorted() if necessary.

Be aware of the O(n log n) cost.

3. Pointer Initialization

left = 0, right = nums.count - 1 for most problems

slow = 0, fast = 0 for sliding window or linked list

anchor + 1, right = nums.count - 1 for triplet-based solutions

4. Define the Invariants

Maintain logical boundaries:

The pointers should converge

All possible combinations between the pointers should be considered

5. Loop Structure

Usually:

while left < right { ... }

For sliding window:

while right < nums.count { ... }

6. Pointer Update Strategy

If the current value is less than target, move left += 1

If greater, move right -= 1

If equal/valid, store result, move both pointers

7. Skip Duplicates

After storing a valid result:

while left < right && nums[left] == nums[left + 1] { left += 1 }
while left < right && nums[right] == nums[right - 1] { right -= 1 }

Also skip duplicate anchors:

if i > 0 && nums[i] == nums[i - 1] { continue }

8. Handle Edge Cases

Fewer than 2 or 3 elements

All values are duplicates

Extreme values (Int.min/Int.max)

9. Result Management

Append valid combinations to result array

Use Set<[Int]> or sort inner triplets to avoid duplicate results

10. Optimize for Space

Most two-pointer solutions use O(1) space (excluding output)

Avoid hash maps if not needed

🧪 Swift Code Examples

Example 1: 3Sum

func threeSum(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()
    var result = [[Int]]()

    for i in 0..<sorted.count - 2 {
        if i > 0 && sorted[i] == sorted[i - 1] {
            continue
        }

        var left = i + 1
        var right = sorted.count - 1

        while left < right {
            let sum = sorted[i] + sorted[left] + sorted[right]

            if sum == 0 {
                result.append([sorted[i], sorted[left], sorted[right]])

                while left < right && sorted[left] == sorted[left + 1] { left += 1 }
                while left < right && sorted[right] == sorted[right - 1] { right -= 1 }

                left += 1
                right -= 1
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }

    return result
}

Example 2: Valid Palindrome

func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
    var left = 0, right = chars.count - 1

    while left < right {
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right -= 1
    }

    return true
}

Example 3: Container With Most Water

func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea = 0

    while left < right {
        let h = min(height[left], height[right])
        let width = right - left
        maxArea = max(maxArea, h * width)

        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }

    return maxArea
}

🧠 Final Note (Senior iOS Engineer Advice)

Mastering the two-pointer technique means learning to recognize patterns. Always ask: “Can I solve this by moving inward or outward from both ends?” If yes, two pointers may give you a more elegant, linear-time solution than brute force.

Turn these patterns into muscle memory — they’ll serve you well in both interviews and production Swift code.



