/*:
 ## BFS
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

import Collections

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var queue: Deque = [root]
        var ans = [Int]()

        while queue.count > 0 {
            var maxValue = queue.first!.val
            let count = queue.count

            for _ in 0 ..< count {
                guard let node = queue.popFirst() else { continue }
                maxValue = max(maxValue, node.val)

                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            ans.append(maxValue)
        }
        return ans
    }
}

class TreeNode {
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
