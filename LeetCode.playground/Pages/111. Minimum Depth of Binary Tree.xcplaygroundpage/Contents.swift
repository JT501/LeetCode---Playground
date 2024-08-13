/*:
 ## Tree, Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

import DequeModule

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        var queue = Deque([root])
        var depth = 1

        while !queue.isEmpty {
            let size = queue.count

            for i in 0..<size {
                let node = queue.popFirst()!

                if node.left == nil && node.right == nil {
                    return depth
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            depth += 1
        }

        return depth
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
