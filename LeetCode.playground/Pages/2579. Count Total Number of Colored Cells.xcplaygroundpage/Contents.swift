/*:
 ## Maths
 ### Time: O(1)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func coloredCells(_ n: Int) -> Int {
        return 1 + (4 * n * (n - 1) / 2)
    }
}
