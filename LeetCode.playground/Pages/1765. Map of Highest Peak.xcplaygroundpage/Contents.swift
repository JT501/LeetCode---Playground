/*:
 ## BFS
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](1.png)
 */


import Collections

class Solution {
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        var ans = isWater
        let m = isWater.count
        let n = isWater[0].count
        let adjacent = [(0,1),(0,-1),(1,0),(-1,0)]
        var queue: Deque<(Int, Int)> = []

        for i in 0..<m {
            for j in 0..<n {
                if isWater[i][j] == 1 {
                    queue.append((i, j))
                    ans[i][j] = 0
                } else {
                    ans[i][j] = -1
                }
            }
        }

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()

            for adj in adjacent {
                let nx = x + adj.0, ny = y + adj.1
                if 0..<m ~= nx && 0..<n ~= ny && ans[nx][ny] == -1 {
                    ans[nx][ny] = ans[x][y] + 1
                    queue.append((nx,ny))
                }
            }
        }

        return ans
    }
}
