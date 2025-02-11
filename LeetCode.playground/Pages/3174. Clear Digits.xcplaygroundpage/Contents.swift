/*:
 ## Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func clearDigits(_ s: String) -> String {
        var stack = [Character]()

        for char in s {
            if char.isNumber {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }

        return String(stack)
    }
}
