/*:
 ## Tracking
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var lastSeen = [-1, -1, -1]
        var s = Array(s.utf8)
        var n = s.count
        var ans = 0

        for right in 0 ..< n {
            lastSeen[Int(s[right]) - 97] = right

            ans += 1 + lastSeen.min()!
        }

        return ans
    }
}

/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func numberOfSubstrings(_ s: String) -> Int {
        var freqMap = [0, 0, 0]
        var s = Array(s.utf8)
        var n = s.count
        var left = 0
        var ans = 0

        for right in 0 ..< n {
            freqMap[Int(s[right]) - 97] += 1

            while freqMap[0] > 0, freqMap[1] > 0, freqMap[2] > 0 {
                ans += n - right
                freqMap[Int(s[left]) - 97] -= 1
                left += 1
            }
        }

        return ans
    }
}
