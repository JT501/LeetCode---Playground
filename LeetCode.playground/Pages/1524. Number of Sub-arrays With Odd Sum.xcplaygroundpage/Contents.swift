/*:
 ## Prefix Sum, Counting
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

import Foundation

class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        var prefixSum = 0
        var evenCount = 0
        var oddCount = 0
        var ans = 0
        var mod = Int(pow(10.0, 9.0) + 7)

        for num in arr {
            prefixSum += num

            if prefixSum % 2 == 0 {
                ans += oddCount
                evenCount += 1
            } else {
                ans += evenCount + 1
                oddCount += 1
            }
        }

        ans %= mod

        return ans
    }
}
