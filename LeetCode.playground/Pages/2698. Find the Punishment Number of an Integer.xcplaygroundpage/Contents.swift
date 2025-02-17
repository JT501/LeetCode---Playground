/*:
 ## Recursive
 ### Time: O(n*2^log10​(n))
 ### Space: O(log10​(n))
 ![submission](1.png)
 */

class Solution {
    func punishmentNumber(_ n: Int) -> Int {
        var sum = 0

        for i in 1...n {
            if isSummable(num: i * i, sum: i) {
                sum += i * i
            }
        }

        return sum
        
        func isSummable(num: Int, sum: Int) -> Bool {
            if num == sum { return true }

            var div = 10

            while div < num {
                let (left, right) = (num / div, num % div)
                if isSummable(num: left, sum: sum - right) { return true }
                div *= 10
            }

            return false
        }
    }
}
