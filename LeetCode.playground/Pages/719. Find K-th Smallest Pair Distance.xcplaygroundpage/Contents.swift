/*:
 ## Binary Search + Sliding Window
 ### Time: O(N * ㏒N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var len = nums.count
        var left = 0 //shortest distance
        var right = nums.last! - nums.first! //largest distance

        while left < right {
            let mid = (left + right) / 2
            let count = countPair(nums: nums, distance: mid, len: len)

            if count < k {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }

    func countPair(nums: [Int], distance: Int, len: Int) -> Int {
        var l = 0, count = 0
        for r in 0..<len {
            while (nums[r] - nums[l]) > distance {
                l += 1
            }
            count += (r - l)
        }
        return count
    }
}
