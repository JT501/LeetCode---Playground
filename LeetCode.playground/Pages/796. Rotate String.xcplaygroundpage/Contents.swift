/*:
 ## String Manipulation
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

import DequeModule

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        let s = Deque(s)
        var _s = s
        let goal = Deque(goal)

        guard s.count == goal.count else { return false }

        for char in s {
            _s.popFirst()
            _s.append(char)
            if _s == goal { return true }
        }
        
        return false
    }
}

let s = Solution()

s.rotateString("abcde", "bcdea")
s.rotateString("abcde", "abced")

/*:
 ## String Manipulation
 ### Time: O(N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }

        return s == goal || (s + s).contains(goal)
    }
}

let s2 = Solution2()

s2.rotateString("abcde", "bcdea")
s2.rotateString("abcde", "abced")
