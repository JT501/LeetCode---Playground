/*:
 ## Dynamic Programming + Prefix-sum
 ### Time: O(N³)
 ### Space: O(N²)
 ![submission](1.png)
 */

class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        var m = 1
        var len = piles.count
        var dp = Array(repeating: Array(repeating: 0, count: len + 1), count: len)
        var prefixSum = Array(repeating: 0, count: len + 1)

        for i in 1..<len+1 {
            prefixSum[i] = piles[i-1] + prefixSum[i-1]
        }

        func dfs(start: Int, m: Int) -> Int {
            if dp[start][m] > 0 {
                return dp[start][m]
            }
            if 2 * m >= len - start {
                return prefixSum[len] - prefixSum[start]
            }

            var maxStones = 0
            for x in 1...2*m {
                maxStones = max(maxStones, prefixSum[len] - prefixSum[start] - dfs(start: start + x, m: max(m, x)))
            }
            dp[start][m] = maxStones
            return maxStones
        }

        return dfs(start: 0, m: 1)
    }
}
