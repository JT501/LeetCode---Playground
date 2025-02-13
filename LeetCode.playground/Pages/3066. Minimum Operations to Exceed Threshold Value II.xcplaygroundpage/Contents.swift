/*:
 ## Hashmap
 ### Time: O(N㏒N)
 ### Space: O(N)
 ![submission](1.png)
 */

import Collections

class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var minHeap = Heap<Int>(nums)

        var ans = 0

        while let m = minHeap.min, m < k {
            minHeap.insert(minHeap.removeMin() * 2 + minHeap.removeMin())
            ans += 1
        }

        return ans
    }
}
