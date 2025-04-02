/*:
 ##  Hashmap
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func maximumTripletValue(_ nums: [Int]) -> Int {
        var curMax = 0, diffMax = 0, result = 0

        for num in nums {
            result = max(result, diffMax * num)
            diffMax = max(diffMax, curMax - num)
            curMax = max(curMax, num)
        }

        return max(result, 0)
    }
}
