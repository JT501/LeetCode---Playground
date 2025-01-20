/*:
 ## Hashmap
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](1.png)
 */

class Solution {
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        var m = mat.count, n = mat[0].count
        var numPosition = Array(repeating: (0, 0), count: m*n + 1)
        var rowPainted = Array(repeating: 0, count: m)
        var colPainted = Array(repeating: 0, count: n)

        for i in 0..<m {
            for j in 0..<n {
                numPosition[mat[i][j]] = (i, j)
            }
        }

        for (i, num) in arr.enumerated() {
            let atRow = numPosition[num].0
            let atCol = numPosition[num].1
            rowPainted[atRow] += 1
            colPainted[atCol] += 1
            if rowPainted[atRow] == n || colPainted[atCol] == m {
                return i
            }
        }

        return -1
    }
}
