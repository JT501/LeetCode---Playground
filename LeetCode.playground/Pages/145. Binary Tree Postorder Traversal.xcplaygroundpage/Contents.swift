/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()

        func dfs(node: TreeNode?) {
            guard let node else { return }

            dfs(node: node.left)
            dfs(node: node.right)

            ans.append(node.val)
        }

        dfs(node: root)

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
