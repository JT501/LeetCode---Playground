/*:
 ## Dynamic Programming (Bottom Up)
 ### Time: O(N³)
 ### Space: O(N²)
 ![submission](1.png)
 */
class Solution {
    func strangePrinter(_ s: String) -> Int {
        let s = Array(s)
        let len = s.count
        var dp = Array(repeating: Array(repeating: 0, count: len), count: len)

        for i in (0..<len).reversed() {
            dp[i][i] = 1

            for j in i+1..<len {
                if s[i] == s[j] {
                    dp[i][j] = dp[i][j-1]
                } else {
                    var temp = Int.max
                    for k in i..<j {
                        temp = min(temp, dp[i][k] + dp[k+1][j])
                    }
                    dp[i][j] = temp
                }
            }
        }

        return dp[0][len-1]
    }
}

/*:
 ## Dynamic Programming (Top Down)
 ### Time: O(N³)
 ### Space: O(N²)
 ![submission](2.png)
 */
class Solution2 {
    func strangePrinter(_ s: String) -> Int {
        let s = Array(s)
        let len = s.count
        var dp = Array(repeating: Array(repeating: Int.max, count: len), count: len)

        for i in 0..<len {
            dp[i][i] = 1
        }

        func minStep(start: Int, end: Int) -> Int {
            guard start <= end else { return 0 }

            if dp[start][end] < Int.max {
                return dp[start][end]
            }

            var res = 1 + minStep(start: start+1, end: end)
            
            for i in start+1...end {
                if s[start] == s[i] {
                    res = min(res, minStep(start: start, end: i-1) + minStep(start: i+1, end: end))
                }
            }
            dp[start][end] = res
            return res
        }

        return minStep(start: 0, end: len-1)
    }
}
