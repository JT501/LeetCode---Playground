/*:
 ## Stack
 ### Time: O(N+M)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var stack = ""

        for char in s {
            stack.append(char)
            if stack.hasSuffix(part) {
                stack.removeLast(part.count)
            }
        }

        return stack
    }
}

/*:
 ## Stack
 ### Time: O(N+M)
 ### Space: O(N)
 ![submission](2.png)
 */

class Solution2 {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var s = Array(s)
        var part = Array(part)
        var stack = [Character]()
        var partLength = part.count

        for char in s {
            stack.append(char)
            let sub = stack.suffix(partLength)
            if part == Array(sub) {
                stack.removeLast(partLength)
            }
        }

        return String(stack)
    }
}
