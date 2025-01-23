/*:
 ## Hashmap
 ### Time: O(M*N)
 ### Space: O(M+N)
 ![submission](1.png)
 */


class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var rowCount = Array(repeating: 0, count: m)
        var colCount = Array(repeating: 0, count: n)
        var server = 0

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    rowCount[i] += 1
                    colCount[j] += 1
                    server += 1
                }
            }
        }

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 && rowCount[i] == 1 && colCount[j] == 1 {
                    server -= 1
                }
            }
        }

        return server
    }
}
