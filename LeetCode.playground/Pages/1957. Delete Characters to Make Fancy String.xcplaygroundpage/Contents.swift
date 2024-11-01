/*:
 ## String Manipulation
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func makeFancyString(_ s: String) -> String {
        var consecutive = 0
        var lastChar: Character = Character(" ")
        var ans: [Character] = []

        for char in s {
            if char == lastChar {
                consecutive += 1
            } else {
                consecutive = 1
            }
            if consecutive > 2 {
                consecutive -= 1
            } else {
                ans.append(char)
            }
            lastChar = char
        }

        return String(ans)
    }
}
