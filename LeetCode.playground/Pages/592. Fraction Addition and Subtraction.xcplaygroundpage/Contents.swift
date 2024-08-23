/*:
 ## String
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func fractionAddition(_ expression: String) -> String {
        let s = Array(expression)
        let len = expression.count
        var tops = [Int]()
        var bottoms = [Int]()
        var i = 0
        var numString = ""

        while i < len {
            if (i != 0 && (s[i] == "-" || s[i] == "+")) {
                bottoms.append(Int(numString) ?? 0)
                numString = String(s[i])
            } else if i == len-1 {
                numString += String(s[i])
                bottoms.append(Int(numString) ?? 0)
            } else if s[i] == "/" {
                tops.append(Int(numString) ?? 0)
                numString = ""
            } else {
                numString += String(s[i])
            }
            i += 1
        }

        for _ in (1..<tops.count) {
            var a = tops.removeLast()
            var b = bottoms.removeLast()
            var c = tops.removeLast()
            var d = bottoms.removeLast()

            let top = a*d + c*b
            let bottom = b * d
            let gcd = gcd(top, bottom)

            tops.append(top / gcd)
            bottoms.append(bottom / gcd)
        }

        let ansTop = tops.last!
        let ansBottom = bottoms.last!
        let negative = ansTop < 0 || ansBottom < 0

        return "\(negative ? "-" : "")\(abs(ansTop))/\(abs(ansBottom))"
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }

        return a
    }
}
