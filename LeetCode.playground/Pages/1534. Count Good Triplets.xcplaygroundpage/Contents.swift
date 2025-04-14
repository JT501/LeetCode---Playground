/*:
 ## Array
 ### Time: O(N^3)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        let n = arr.count
        var ans = 0

        for i in 0..<n {
            for j in i+1..<n {
                if (abs(arr[i] - arr[j])) <= a {
                    for k in j+1..<n {
                        if (abs(arr[j] - arr[k])) <= b {
                            if (abs(arr[i] - arr[k])) <= c {
                                ans += 1
                            }
                        }
                    }
                }
            }
        }

        return ans
    }
}
