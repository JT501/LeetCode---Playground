/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func postorder(_ root: Node?) -> [Int] {
        var ans = [Int]()

        func dfs(node: Node?) {
            guard let node else {
                return
            }

            if !node.children.isEmpty {
                for child in node.children {
                    dfs(node: child)
                }
            }

            ans.append(node.val)
        }

        dfs(node: root)

        return ans
    }
}

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        children = []
    }
}
