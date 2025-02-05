/*:
 ## Counting
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        let n = s1.count
        let s1 = Array(s1), s2 = Array(s2)
        var indices = [Int]()

        for i in 0..<n {
            if indices.count > 2 {
                return false
            }

            if s1[i] != s2[i] {
                indices.append(i)
            }
        }

        if indices.count == 2 {
            let first = indices[0], last = indices[1]
            if s1[first] != s2[last] || s1[last] != s2[first] {
                return false
            }
        }

        return indices.count == 2 || indices.count == 0
    }
}
