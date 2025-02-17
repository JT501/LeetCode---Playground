/*:
 ## Backtracking
 ### Time: O(2ᴺ)
 ### Space: O(n)
 ![submission](1.png)
 */

class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var freq = Array(repeating: 0, count: 26)

for tile in tiles {
            let idx = Int(tile.asciiValue! - Character("A").asciiValue!)
            freq[idx] += 1
        }

        return dfs()

        func dfs() -> Int {
            var ans = 0

            for i in 0..<26 where freq[i] != 0 {
                ans += 1
                freq[i] -= 1
                ans += dfs()
                freq[i] += 1
            }
            return ans
        }
    }
}

/*:
 ## Backtracking
 ### Time: O(2ᴺ)
 ### Space: O(n)
 ![submission](2.png)
 */

class Solution2 {
    func numTilePossibilities(_ tiles: String) -> Int {
        var freqDict = [Character: Int]()

        for tile in tiles {
            freqDict[tile, default: 0] += 1
        }

        return dfs()

        func dfs() -> Int {
            var ans = 0

            for char in freqDict.keys where freqDict[char] != 0 {
                ans += 1
                freqDict[char]! -= 1
                ans += dfs()
                freqDict[char]! += 1
            }
            return ans
        }
    }
}
