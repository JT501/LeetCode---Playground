/*:
 ## Greedy
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var (m, M) = (99999, -99999)
        var ans = 0

        for i in 0..<arrays.count {
            ans = max(ans, M - arrays[i].first!, arrays[i].last! - m)
            (m, M) = (min(m, arrays[i].first!), max(M, arrays[i].last!))
        }

        return ans
    }
}

/*:
 ## Recursion
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var len = arrays.count
        var ans = 0

        func recursive(start: Int, minN: Int, maxN: Int) -> Int {
            guard start < len else {
                return maxN - minN
            }

            let arr = arrays[start]
            
            if maxN < arrays[start].last! && minN > arrays[start].first! {
                let left = recursive(start: start + 1, minN: arr.first!, maxN: maxN)
                let right = recursive(start: start + 1, minN: minN, maxN: arr.last!)
                return max(left, right)
            }

            return recursive(start: start + 1, minN: min(minN, arr.first!), maxN: max(maxN, arr.last!))
        }

        return recursive(start: 0, minN: 999999, maxN: -999999)
    }
}
