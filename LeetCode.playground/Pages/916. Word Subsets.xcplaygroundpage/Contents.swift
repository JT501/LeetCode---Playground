/*:
 ## Hashmap
 ### Time: O(26*10*M + 26*10*N) -> O(M+N) where N = words1.count, M = words2.count
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        var ans = [String]()
        var maxCount = [Character: Int]()

        for word in words2 {
            let charCount = count(word)

            for (key, value) in charCount {
                maxCount[key, default: 0] = max(maxCount[key, default: 0], value)
            }
        }

        for word in words1 {
            let charCount = count(word)

            var isUniversal = true
            for (key, value) in maxCount {
                if value > charCount[key, default: 0] {
                    isUniversal = false
                    break
                }
            }

            if isUniversal { ans.append(word) }
        }

        return ans

        func count(_ word: String) -> [Character: Int] {
            var dict = [Character: Int]()

            for char in word {
                dict[char, default: 0] += 1
            }

            return dict
        }
    }
}
