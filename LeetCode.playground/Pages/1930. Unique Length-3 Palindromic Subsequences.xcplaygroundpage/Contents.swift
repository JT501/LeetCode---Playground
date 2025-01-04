/*:
 ## Hashmap
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        var s = Array(s)
        var hashmap = [Character: [Int]]()
        var ans = 0

        for (i, char) in s.enumerated() {
            hashmap[char, default: []].append(i)
        }

        for (key, indice) in hashmap {
            guard indice.count > 1 else { continue }
            guard let f = indice.first, let l = indice.last else { continue }
            var charSet = Set<Character>()
            for i in f+1..<l {
                charSet.insert(s[i])
            }
            
            ans += charSet.count
        }

        return ans
    }
}
