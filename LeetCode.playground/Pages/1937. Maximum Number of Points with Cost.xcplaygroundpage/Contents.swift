/*:
 ## Dynamic Programming
 ### Time: O(M*N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        let m = points.count, n = points[0].count
        var dp = points[0]

        for row in points[1..<m] {
            var cur = Array(repeating: 0, count: n)

            var lmx = Int.min, rmx = Int.min

            for j in 0..<n {
                lmx = max(lmx, dp[j] + j)
                cur[j] = max(cur[j], row[j] + lmx - j)
            }

            for j in (0..<n).reversed() {
                rmx = max(rmx, dp[j] - j)
                cur[j] = max(cur[j], row[j] + rmx + j)
            }

            dp = cur
        }

        return dp.max()!
    }
}

/*:
 ## Dynamic Programming
 ### Time: O(M*N²)
 ### Space: O(M*N)
 ![submission](2.png)
 */
class Solution2 {
    func maxPoints(_ points: [[Int]]) -> Int {
        let m = points.count, n = points[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

        dp[0] = points[0]

        for i in 1..<m {
            for j in 0..<n {
                for k in 0..<n {
                    let pt = points[i][j] - abs(j-k) + dp[i-1][k]
                    if (pt > dp[i][j]) {
                        dp[i][j] = pt
                    }
                }
            }
        }

        return dp[m-1].max()!
    }
}
