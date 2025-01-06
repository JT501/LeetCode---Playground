/*:
 ## 
 ### Time: O(N²)
 ### Space: O(N2)
 ![submission](1.png)
 */

class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        let len = boxes.count
        var idice = [Int]()
        var ans = [Int]()

        for (i, box) in boxes.enumerated() {
            if box == "1" {
                idice.append(i)
            }
        }

        for j in 0..<len {
            var op = 0
            for idx in idice {
                if idx == j { continue}
                if idx > j {
                    op += idx - j
                } else {
                    op += j - idx
                }
            }
            ans.append(op)
        }

        return ans
    }
}
