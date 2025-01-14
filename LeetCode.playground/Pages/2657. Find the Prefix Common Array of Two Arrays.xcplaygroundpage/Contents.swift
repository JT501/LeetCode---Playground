/*:
 ## Counting
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var len = A.count
        var numCount = Array(repeating: 0, count: len + 1)
        var counter = 0
        var ans = [Int]()

        for i in 0..<len {
            numCount[A[i]] += 1

            if numCount[A[i]] == 2 {
                counter += 1
            }

            numCount[B[i]] += 1

            if numCount[B[i]] == 2 {
                counter += 1
            }
            
            ans.append(counter)
        }

        return ans
    }
}
