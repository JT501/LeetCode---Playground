/*:
 ## Binary Tree, Recursion
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
}

let s = Solution()

s.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s.maxDepth(TreeNode(1, nil, TreeNode(2)))

/*:
 ## Binary Tree, Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
         guard let root else { return 0 }

         var queue = [root]
         var depth = 0
         
         while !queue.isEmpty {
            let size = queue.count
            var curLevel = [TreeNode]()

            for i in 0..<size {
                let node = queue[i]

                if let left = node.left {
                    curLevel.append(left)
                }
                if let right = node.right {
                    curLevel.append(right)
                }
            }
            depth += 1
            queue = curLevel
         }

         return depth
    }
}

/*:
 ## Binary Tree, Iteration
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */

class Solution3 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack = [(Int, TreeNode?)]()

        stack.append((1, root))
        var depth = 0

        while !stack.isEmpty {
            let (current_depth, _root) = stack.removeLast()

            if let _root = _root {
                depth = max(depth, current_depth)
                stack.append((current_depth + 1, _root.left))
                stack.append((current_depth + 1, _root.right))
            }
        }

        return depth
    }
}

let s3 = Solution3()

s3.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s3.maxDepth(TreeNode(1, nil, TreeNode(2)))

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
