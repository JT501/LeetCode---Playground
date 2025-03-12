/*:
 ##  Binary Search
 ### Time: O(㏒N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func maximumCount(_ nums: [Int]) -> Int {
        let neg = binarySearch(nums, predicate: { $0 < 0 })
        let pos = nums.count - binarySearch(nums, predicate: { $0 <= 0 })

        return max(neg, pos)
    }

    func binarySearch(_ nums: [Int], predicate: (Int) -> Bool) -> Int {
        var (left, right) = (0, nums.count)

        while left != right {
            let mid = left + (right - left) / 2
            (left, right) = predicate(nums[mid]) ? (mid + 1, right) : (left, mid)
        }

        return left
    }
}

/*:
 ## Brute Force
 ### Time: O(N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func maximumCount(_ nums: [Int]) -> Int {
        var count = [0, 0]
        for num in nums {
            if num < 0 { count[0] += 1 }
            if num > 0 { count[1] += 1 }
        }

        return count.max() ?? 0
    }
}
