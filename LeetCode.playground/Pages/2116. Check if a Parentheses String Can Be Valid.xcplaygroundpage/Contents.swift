/*:
 ## Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        let s = Array(s)
        let locked = Array(locked)
        let len = s.count
        guard len % 2 == 0 else { return false }

        var openStack = [Int]()
        var unlockStack = [Int]()

        for i in 0..<len {
            if locked[i] == "0" {
                unlockStack.append(i)
            } else if s[i] == "(" {
                openStack.append(i)
            } else if s[i] == ")" {
                if !openStack.isEmpty {
                    openStack.popLast()
                } else if !unlockStack.isEmpty {
                    unlockStack.popLast()
                } else {
                    return false
                }
            }
        }

        while !openStack.isEmpty && !unlockStack.isEmpty && openStack.last! < unlockStack.last! {
            openStack.popLast()
            unlockStack.popLast()
        }

        return openStack.count == 0
    }
}
