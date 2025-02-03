/*:
 ## Array
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var increasingCount = 1
        var decreasingCount = 1
        var longest = 0

        guard n > 1 else { return 1 }

        for i in 1..<n {
            if nums[i] > nums[i-1] {
                increasingCount += 1
                decreasingCount = 1
            } else if nums[i] < nums[i-1] {
                decreasingCount += 1
                increasingCount = 1
            } else {
                increasingCount = 1
                decreasingCount = 1
            }
            longest = max(longest, increasingCount, decreasingCount)
        }

        return longest
    }
}
