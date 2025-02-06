/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func distinctNumbers(_ nums: [Int], _ k: Int) -> [Int] {
        var ans = [Int]()
        var freqMap = Array(repeating: 0, count: 100_000 + 1)
        var distinct = 0

        for (i, num) in nums.enumerated() {
            freqMap[num] += 1
            if freqMap[num] == 1 {
                distinct += 1
            }

            if i >= k {
                freqMap[nums[i-k]] -= 1
                if freqMap[nums[i-k]] == 0 {
                    distinct -= 1
                }
            }

            if i >= k-1 {
                ans.append(distinct)
            }
        }

        return ans
    }
}

/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(K)
 ![submission](2.png)
 */

class Solution2 {
    func distinctNumbers(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var ans = [Int]()
        var freqMap = [Int: Int]()

        for i in 0..<k {
            freqMap[nums[i], default: 0] += 1
        }
        ans.append(freqMap.count)

        var right = k
        var i = 1
        while right < n {
            freqMap[nums[i-1], default: 0] -= 1
            if freqMap[nums[i-1]] == 0 {
                freqMap.removeValue(forKey: nums[i-1])
            }
            freqMap[nums[right], default: 0] += 1
            ans.append(freqMap.count)
            i += 1
            right += 1
        }

        return ans
    }
}
