/*:
 ## String Manipulation
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func isCircularSentence(_ sentence: String) -> Bool {
        let sentence = Array(sentence)
        let length = sentence.count

        for (i, char) in sentence.enumerated() {
            if char.isWhitespace {
                if sentence[i - 1] != sentence[i + 1] {
                    return false
                }
            }
            if i == length - 1 {
                return char == sentence[0]
            }
        }
        return false
    }
}
