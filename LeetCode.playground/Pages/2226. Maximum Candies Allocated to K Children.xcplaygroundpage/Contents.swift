/*:
 ##  Binary Search
 ### Time: O(N*㏒N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        var left = 1, right = candies.max()!
        if candies.reduce(0, +) < k { return 0 }

        var ans = 0

        func canDistribute(each: Int) -> Bool {
            var count = 0
            for candy in candies {
                count += candy / each
            }
            return count >= k
        }

        while left <= right {
            let mid = left + (right - left) / 2
            if canDistribute(each: mid) {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return ans
    }
}
