/*:
 ## String
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        let words = words.sorted(by: { $0.count < $1.count })
        var ans = [String]()

        for word in words {
            for w in words.reversed() {
                guard word.count < w.count else { break }
                if w.contains(word) {
                    ans.append(word)
                    break
                }
            }
        }

        return ans
    }
}
