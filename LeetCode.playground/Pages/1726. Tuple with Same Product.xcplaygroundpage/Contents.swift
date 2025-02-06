/*:
 ## Counting
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](1.png)
 */

class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        let n = nums.count
        var freqMap = [Int: Int]()
        var count = 0

        guard n >= 4 else { return 0 }

        for i in 0..<(n-1) {
            for j in (i+1)..<n {
                freqMap[nums[i]*nums[j], default: 0] += 1
            }
        }

        for (key, value) in freqMap {
            if value > 1 {
                let combination = (value * (value - 1)) / 2
                count += (combination * 8)
            }
        }

        return count
    }
}
