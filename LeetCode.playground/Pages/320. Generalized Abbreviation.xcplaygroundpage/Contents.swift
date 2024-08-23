/*:
 ## Backtracking
 ### Time: O(N * 2ᴺ)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func generateAbbreviations(_ word: String) -> [String] {
        let word = Array(word), n = word.count
        var ans = [String]()

        func dfs(start: Int, path: [Character]) {
            var path = path
            var remainingLength = n - start

            if start >= n {
                ans.append(String(path))
                return
            }

            for i in (1...remainingLength).reversed() {
                path.append(Character("\(i)"))

                if i < remainingLength {
                    path.append(word[start + i])
                    dfs(start: start + i + 1, path: path)
                    path.removeLast()
                } else {
                    dfs(start: start + i, path: path)
                }
                path.removeLast()
            }

            dfs(start: start+1, path: path + [word[start]])
        }

        dfs(start: 0, path: [])

        return ans
    }
}
