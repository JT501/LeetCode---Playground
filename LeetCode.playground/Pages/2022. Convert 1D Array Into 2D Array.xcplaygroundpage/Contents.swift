/*:
 ## Array
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard original.count == m*n else { return [] }

        var ans = [[Int]]()

        var i = 0, j = 0
        var temp = [Int]()
        for num in original {
            temp.append(num)
            j += 1
            if j == n {
                ans.append(temp)
                temp = []
                i += 1
                j = 0
            }
        }

        return ans
    }
}
