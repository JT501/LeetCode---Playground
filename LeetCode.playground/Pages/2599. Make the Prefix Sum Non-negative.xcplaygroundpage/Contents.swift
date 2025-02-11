/*:
 ## Greedy Heap
 ### Time: O(N㏒N)
 ### Space: O(N)
 ![submission](1.png)
 */
import Collections

class Solution {
    func makePrefSumNonNegative(_ nums: [Int]) -> Int {
        var prefixSum = 0
        var negNums = Heap<Int>()
        var ans = 0

        for num in nums {
            prefixSum += num
            if num < 0 {
                negNums.insert(num)
            }
            if prefixSum < 0 {
                ans += 1
                prefixSum -= negNums.popMin()!
            }
        }

        return ans
    }
}

/*:
 ## Greedy + Array
 ### Time: O(N㏒N)
 ### Space: O(N)
 ![submission](2.png)
 */

class Solution2 {
    func makePrefSumNonNegative(_ nums: [Int]) -> Int {
        var prefixSum = 0
        var numsMeet = [Int]()
        var ans = 0

        for num in nums {
            prefixSum += num
            if num < 0 {
                numsMeet.append(num)
            }
            if prefixSum < 0 {
                ans += 1
                let minNum = numsMeet.min()!
                prefixSum -= minNum
                if let idx = numsMeet.firstIndex(where: {$0 == minNum}) {
                    numsMeet.remove(at: idx)
                }
            }
        }

        return ans
    }
}
