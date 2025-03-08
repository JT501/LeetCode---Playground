/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blocks = Array(blocks)
        var minWhite = k
        var whiteCount = 0

        for (i, block) in blocks.enumerated() {
            if i < k {
                if block == "W" {
                    whiteCount += 1
                }
            } else {
                if block == "W" && blocks[i - k] == "B" {
                    whiteCount += 1
                } else if block == "B" && blocks[i - k] == "W" {
                    whiteCount -= 1
                }
            }
            if i >= k - 1 {
                minWhite = min(whiteCount, minWhite)
            }
        }

        return  minWhite
    }
}
