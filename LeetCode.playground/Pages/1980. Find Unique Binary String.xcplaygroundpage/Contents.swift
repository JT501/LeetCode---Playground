/*:
 ## XOR
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        var idx = nums[0].startIndex
        var ans = ""

        for num in nums {
            ans.append(num[idx] == "0" ? "1" : "0")
            idx = num.index(after: idx)
        }

        return ans
    }
}

/*:
 ## Backtracking
 ### Time: O(2ᴺ)
 ### Space: O(n)
 ![submission](2.png)
 */

class Solution2 {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let n = nums.count
        let nums = Set(nums)

        return backtracking(s: "")

        func backtracking(s: String) -> String {
            if s.count == n {
                if !nums.contains(s) {
                    return s
                }
                return ""
            }

            let zero = backtracking(s: s + "0")

            if zero.count == n { return zero }

            return backtracking(s: s + "1")
        }
    }
}
