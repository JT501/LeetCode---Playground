/*:
 ## Tree, Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

import DequeModule

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }

        var queue = Deque([root])
        var ans = [Int]()

        while !queue.isEmpty {
            let size = queue.count

            for i in 0 ..< size {
                let node = queue.popFirst()!

                if i == size - 1 {
                    ans.append(node.val)
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }

        return ans
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
