/*:
 ## Prefix Sum
 ### Time: O(M + N) M = word.count, N = queries.count
 ### Space: O(M)
 ![submission](1.png)
 */

class Solution {
    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        let vowel = Set<Character>(["a", "e", "i", "o", "u"])
        var prefixSum = [Int]()
        var ans = [Int]()

        for word in words {
            if vowel.contains(word.first!) && vowel.contains(word.last!) {
                prefixSum.append((prefixSum.last ?? 0) + 1)
            } else {
                prefixSum.append(prefixSum.last ?? 0)
            }
        }

        for query in queries {
            let lhs = query[0], rhs = query[1]
            if lhs - 1 >= 0 {
                ans.append(prefixSum[rhs] - prefixSum[lhs - 1])
            } else {
                ans.append(prefixSum[rhs])
            }
        }

        return ans
    }
}
