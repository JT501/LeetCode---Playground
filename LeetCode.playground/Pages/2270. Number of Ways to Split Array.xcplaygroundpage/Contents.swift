/*:
 ## Prefix Sum
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        var prefixSum = [Int]()
        var ans = 0

        for num in nums {
            prefixSum.append((prefixSum.last ?? 0) + num)
        }

        for (i, sum) in prefixSum.enumerated() {
            guard i < nums.count - 1 else { break }
            if sum >= (prefixSum.last! - sum) {
                ans += 1
            }
        }

        return ans
    }
}
