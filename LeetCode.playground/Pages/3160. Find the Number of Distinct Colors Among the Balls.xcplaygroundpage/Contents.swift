/*:
 ## Hashmap
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var ballColors = [Int: Int]()
        var colorFreq = [Int: Int]()
        var result = [Int]()

        for query in queries {
            let ball = query[0], newColor = query[1]
            if let originalColor = ballColors[ball] {
                colorFreq[originalColor, default: 0] -= 1
                if colorFreq[originalColor, default: 0] == 0 {
                    colorFreq.removeValue(forKey: originalColor)
                }
            }
            // Update ball color
            ballColors[ball] = newColor
            // Update color frequency
            colorFreq[newColor, default: 0] += 1

            result.append(colorFreq.count)
        }
        return result
    }
}
