/*:
 ## Hashmap, Counting
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var n = nums.count
        var freqMap = [Int: Int]()
        var goodCount = 0
        var totalCount = n * (n - 1) / 2

        for i in 0..<n {
            freqMap[nums[i] - i, default: 0] += 1
        }
        for (key, value) in freqMap {
            if value > 1 {
                goodCount += value * (value - 1) / 2
            }
        }

        return totalCount - goodCount
    }
}
