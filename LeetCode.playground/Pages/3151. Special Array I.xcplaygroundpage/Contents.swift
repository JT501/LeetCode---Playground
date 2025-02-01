/*:
 ## Array
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func isArraySpecial(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 1 else { return true }

        for i in (1..<n) {
            if nums[i-1] % 2 == nums[i] % 2 {
                return false
            }
        }

        return true
    }
}
