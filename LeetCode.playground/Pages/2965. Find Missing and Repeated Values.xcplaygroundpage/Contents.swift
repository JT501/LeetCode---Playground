/*:
 ## Maths
 ### Time: O(N²)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let n = grid.count
        let total = n * n
    
        var sum: Int = 0
        var sumSquares: Int = 0
    
        for row in grid {
            for num in row {
                sum += num
                sumSquares += num * num
            }
        }
    
        let expectedSum = total * (total + 1) / 2
        let expectedSumSquares = total * (total + 1) * (2 * total + 1) / 6
    
        let diff = sum - expectedSum
        let diffSquares = sumSquares - expectedSumSquares
    
        let sumAB = diffSquares / diff
    
        let a = (diff + sumAB) / 2
        let b = a - diff
    
        return [a, b]
    }
}

/*:
 ## Hashmap
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](2.png)
 */
class Solutio2 {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let n = grid.count
        var numMap = [Int: Int]()
        var ans = [0, 0]

        for i in 1...(n*n) {
            numMap[i, default: 0] = 1
        }

        for row in grid {
            for num in row {
                if numMap.removeValue(forKey: num) == nil {
                    ans[0] = num
                }
            }
        }
        ans[1] = numMap.keys.first!

        return ans
    }
}
