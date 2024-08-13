/*:
 ## Backtracking
 ### Time: O(2^N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var len = candidates.count
        var candidates = candidates.sorted()
        var ans = [[Int]]()

        func backtrack(start: Int, path: [Int], sum: Int) {
            var path = path

            if sum == target {
                ans.append(path)
                return
            }

            for i in start..<len {
                if (sum + candidates[i]) > target {
                    break
                }
                if i != start && candidates[i] == candidates[i - 1] {
                    continue
                }
                path.append(candidates[i])
                backtrack(start: i + 1, path: path, sum: sum + candidates[i])
                path.popLast()
            }
        }

        backtrack(start: 0, path: [], sum: 0)

        return ans
    }
}

let s = Solution().combinationSum2

s([10,1,2,7,6,1,5], 8)

