/*:
 ## Hashmap
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        let len = s.count
        // max palindromes can construct = no. of character in s
        guard len >= k else { return false }

        var charDict = [Character: Int]()

        for char in s {
            charDict[char, default: 0] += 1
        }

        var oddCount = 0
        for (key, value) in charDict {
            if value % 2 != 0 {
                oddCount += 1
            }
        }

        // min palindromes can construct = no. of character with odd count
        return k >= oddCount
    }
}
