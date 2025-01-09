/*:
 ## String
 ### Time: O(N*M) where N = words.count, M = pref.count
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        words.filter { $0.hasPrefix(pref) }.count
    }
}
