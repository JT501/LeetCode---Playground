/*:
 ## Array
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        let n = nums.count
        var maxSum = nums[0]
        var curSum = nums[0]

        for i in 1..<n {
            if nums[i-1] < nums[i] {
                curSum += nums[i]
            } else {
                curSum = nums[i]
            }
            maxSum = max(curSum, maxSum)
        }

        return maxSum
    }
}
