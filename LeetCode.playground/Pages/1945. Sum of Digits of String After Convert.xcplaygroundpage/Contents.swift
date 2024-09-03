/*:
 ## String
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var numString = stringToNumber(s)
        var ans = 0, count = 0
        
        while count < k {
            ans = 0
            for char in numString {
                ans += Int("\(char)")!
            }
            count += 1
            numString = String(ans)
        }

        return ans
    }

    func stringToNumber(_ s: String) -> String {
        var string = ""
        for char in s {
            let num = char.asciiValue! - Character("a").asciiValue! + 1
            string += String(num)
        }
        return string
    }
}
