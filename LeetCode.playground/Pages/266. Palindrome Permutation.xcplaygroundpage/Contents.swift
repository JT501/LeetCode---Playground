/*:
 ##  Hashmap
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        var charCount = [Character: Int]()

        for char in s {
            charCount[char, default: 0] += 1
        }

        var oddCount = 0
        for (key, value) in charCount {
            if value % 2 != 0 {
                oddCount += 1
            }
            if oddCount > 1 {
                return false
            }
        }

        return true
    }
}
