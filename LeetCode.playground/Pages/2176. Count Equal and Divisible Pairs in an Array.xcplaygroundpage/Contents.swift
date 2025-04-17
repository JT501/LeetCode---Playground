/*:
 ## Array
 ### Time: O(N²)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var ans = 0

        for i in 0..<n-1 {
            for j in i+1..<n {
                if nums[i] == nums[j] && (i * j) % k == 0 {
                    ans += 1
                }
            }
        }

        return ans
    }
}
