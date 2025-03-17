/*:
 ##  Hashmap
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var freq = [Int:Int]()

        for num in nums {
            freq[num, default: 0] += 1
            if freq[num]! == 2 {
                freq[num] = nil
            }
        }

        return freq.isEmpty
    }
}
