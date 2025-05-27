//
//  TreeNode 2.swift
//  LeetCode
//
//  Created by Ives Murillo on 5/24/25.
//

final class TreeNode<T> {
    let value: T
    var children: [TreeNode] = []

    init(_ value: T) {
        self.value = value
    }

    func add(_ child: TreeNode) {
        children.append(child)
    }

    func forEachDepthFirst(visit: (TreeNode) -> Void)  {
       visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }


    func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)

        var queue = QueueArray<TreeNode>()
        children.forEach { queue.enqueue($0)}
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0)}
        }
    }


}

extension TreeNode  where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
