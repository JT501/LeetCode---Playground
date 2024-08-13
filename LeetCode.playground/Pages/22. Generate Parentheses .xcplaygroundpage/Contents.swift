/*:
 ## Backtracking
 ### Time: O(4ᴺ/√N)
 ### Space: O(4ᴺ/√N)
 ![submission](1.png)
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        
        func backtrack(path: [String], opens: Int, closes: Int) {
            var path = path
            if closes > opens {
                return
            }
            if opens == n {
                var temp = path
                if (opens - closes > 0) {
                    temp.append(contentsOf: Array(repeating: ")", count: opens - closes))
                }
                ans.append(temp.joined())
                return
            }
            for p in ["(", ")"] {
                path.append(p)
                backtrack(path: path, opens: p == "(" ? opens + 1 : opens, closes: p == ")" ? closes + 1 : closes)
                path.popLast()
            }
        }

        backtrack(path: ["("], opens: 1, closes: 0)

        return ans
    }
}

let s = Solution().generateParenthesis

s(1)
s(2)
s(3)
s(4)
