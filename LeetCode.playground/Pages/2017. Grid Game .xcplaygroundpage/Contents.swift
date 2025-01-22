/*:
 ## Prefix Sum
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        var firstRowSum = grid[0].reduce(0, +)
        var secondRowSum = 0
        var ans = Int.max

        for i in 0..<n {
            // total score of top row if 1st robot move down at i
            let top = firstRowSum - grid[0][i]
            // 2nd robot can only choice the max row
            let secondRobot = max(top, secondRowSum)
            // 1st robot has to choice the min score 2nd robot can take
            ans = min(ans, secondRobot)
            
            secondRowSum += grid[1][i]
        }

        return ans
    }
}


/*:
 ## Prefix Sum
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */

class Solution2 {
    func gridGame(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        var firstRowSum = grid[0]
        var secondRowSum = grid[1]
        var ans = Int.max

        // Prefix Sum
        for i in 1..<n {
            firstRowSum[i] += firstRowSum[i - 1]
            secondRowSum[i] += secondRowSum[i - 1]
        }

        for i in 0..<n {
            // total score of top row if 1st robot move down at i
            let top = firstRowSum.last! - firstRowSum[i]
            // total score of bottom row if 1st robot move down at i
            let bottom = (i == 0) ? 0 : secondRowSum[i - 1]
            // 2nd robot can only choice the max row
            let secondRobot = max(top, bottom)
            // 1st robot has to choice the min score 2nd robot can take
            ans = min(ans, secondRobot)
        }

        return ans
    }
}
