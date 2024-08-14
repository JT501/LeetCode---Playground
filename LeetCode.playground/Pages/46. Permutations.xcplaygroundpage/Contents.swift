/*:
 ## Backtracking
 ### Time: O(N*N!)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var len = nums.count
        var ans = [[Int]]()

        func backtrack(path: [Int], used: Set<Int>) {
            var used = used
            if path.count == len {
                ans.append(path)
                return
            }
            for num in nums {
                if used.contains(num) {
                    continue
                }
                used.insert(num)
                backtrack(path: path + [num], used: used)
                used.remove(num)
            }
        }

        backtrack(path: [], used: [])

        return ans
    }
}

let s = Solution()

s.permute([1,2,3])
s.permute([0, 1])
s.permute([1])
