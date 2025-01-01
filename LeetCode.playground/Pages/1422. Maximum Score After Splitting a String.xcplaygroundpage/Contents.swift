/*:
 ## String
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func maxScore(_ s: String) -> Int {
        var count1 = s.filter { $0 == "1" }.count
        var count0 = 0
        var ans = 0

        for c in s.dropLast() {
            if c == "0" {
                count0 += 1
            } else {
                count1 -= 1
            }

            ans = max(ans, count0 + count1)
        }

        return ans
    }
}
