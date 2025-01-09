/*:
 ## String
 ### Time: O(N²*M) where n = words.count, m = average length of all words
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        func isPrefixAndSuffix(_ str1: String, _ str2: String) -> Bool {
            str2.hasPrefix(str1) && str2.hasSuffix(str1)
        }

        let len = words.count
        var ans = 0

        for i in 0..<len-1 {
            for j in i+1..<len {
                if isPrefixAndSuffix(words[i], words[j]) {
                    ans += 1
                }
            }
        }

        return ans
    }
}
