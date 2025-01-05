/*:
 ## Prefix Sum
 ### Time: O(M+N) where M is s.count, N is shifts.count
 ### Space: O(M)
 ![submission](1.png)
 */

class Solution {
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        var s = Array(s)
        let aAscii = Character("a").asciiValue!
        var changes = Array(repeating: 0, count: s.count + 1)

        for shift in shifts {
            changes[shift[0]] += shift[2] == 0 ? -1 : 1
            changes[shift[1] + 1] += shift[2] == 0 ? 1 : -1
        }

        for i in 1 ..< s.count {
            changes[i] += changes[i - 1]
        }

        for (i, char) in s.enumerated() {
            var change = changes[i] % 26
            if change < 0 { change += 26 }
            var new = char.asciiValue! - aAscii + UInt8(change)
            new %= 26
            s[i] = Character(UnicodeScalar(new + aAscii))
        }

        return String(s)
    }
}

/*:
 ## Brute Force
 ### Time: O(M*N) where M is s.count, N is shifts.count
 ### Space: O(M)
 ![submission](2.png)
 */

class Solution2 {
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        var s = s.map { Int($0.asciiValue! - Character("a").asciiValue!) }

        func shiftChar(_ char: Int, direction: Int) -> Int {
            var char = char

            if direction == 0 {
                char -= 1
                if char < 0 {
                    char += 26
                }
            } else {
                char += 1
                if char > 25 {
                    char -= 26
                }
            }

            return char
        }

        for shift in shifts {
            for i in shift[0] ... shift[1] {
                s[i] = shiftChar(s[i], direction: shift[2])
            }
        }

        let ans = s.map { Character(UnicodeScalar(UInt8($0) + Character("a").asciiValue!)) }

        return String(ans)
    }
}
