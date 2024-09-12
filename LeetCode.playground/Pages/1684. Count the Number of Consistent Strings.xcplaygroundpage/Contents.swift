/*:
 ## String
 ### Time: O(N*M)
 ### Space: O(k)
 ![submission](1.png)
 */

class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let allowed = Set(Array(allowed))
        var ans = words.count

        for word in words {
            for char in word {
                if allowed.contains(char) {
                    continue
                } else {
                    ans -= 1
                    break
                }
            }
        }

        return ans
    }
}
