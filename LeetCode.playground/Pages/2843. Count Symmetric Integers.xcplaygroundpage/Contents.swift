/*:
 ## Array
 ### Time: O(N) N = high - low
 ### Space: O(N * M) M = Length of high
 ![submission](1.png)
 */

class Solution {
    func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
        var ans = 0

        for i in low...high {
            let s = String(i)
            let len = s.count

            guard len % 2 == 0 else { continue }

            let n = len / 2
            var left = 0, right = 0
            var arr = Array(s)
            
            for j in 0..<n {
                left += Int(String(arr[j])) ?? 0
            }
            
            for k in n..<len {
                right += Int(String(arr[k])) ?? 0
            }
            
            if left > 0 && left == right {
                ans += 1
            }
        }

        return ans
    }
}
