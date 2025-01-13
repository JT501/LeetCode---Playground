/*:
 ## Stack
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func minimumLength(_ s: String) -> Int {
        var charDict = [Character: Int]()

        for char in s {
            charDict[char, default: 0] += 1
        }

        return charDict.reduce(0) { result, element in
            if element.value > 2 {
                if element.value % 2 == 0 {
                    return result + element.value % 2 + 2
                }
                return result + element.value % 2
            }
            return result + element.value
        }
    }
}
