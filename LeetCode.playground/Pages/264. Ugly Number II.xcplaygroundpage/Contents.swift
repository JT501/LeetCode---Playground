/*:
 ## Dynamic Programming
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var k = 1
        var dp = Array(repeating: 0, count: n)
        
        dp[0] = 1
        var min2 = (value: 2, i: 0)
        var min3 = (value: 3, i: 0)
        var min5 = (value: 5, i: 0)

        while k < n {
            dp[k] = min(min2.value, min3.value, min5.value)
            if dp[k] == min2.value {
                min2.i += 1
                min2.value = dp[min2.i] * 2
            }
            if dp[k] == min3.value {
                min3.i += 1
                min3.value = dp[min3.i] * 3
            }
            if dp[k] == min5.value {
                min5.i += 1
                min5.value = dp[min5.i] * 5
            }
            k += 1
        }

        return dp[n-1]
    }
}

/*:
 ## Set
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func nthUglyNumber(_ n: Int) -> Int {
        var ugly: Set<Int> = [1]
        var ans = 1

        for i in (1...n) {
            ans = ugly.min()!
            ugly.remove(ans)
            ugly.insert(ans * 2)
            ugly.insert(ans * 3)
            ugly.insert(ans * 5)
        }

        return ans
    }
}
