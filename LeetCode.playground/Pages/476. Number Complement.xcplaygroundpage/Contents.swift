/*:
 ## Bitmask
 ### Time: O(1)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func findComplement(_ num: Int) -> Int {
        (~num << num.leadingZeroBitCount) >> num.leadingZeroBitCount
    }
}

/*:
 ## Bitmask
 ### Time: O(1)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func findComplement(_ num: Int) -> Int {
        var result = 0
        var num = num
        
        for bit in 0..<Int.bitWidth {
            guard num > 0 else { break }
            result |= (num & 1 ^ 1) << bit
            num >>= 1
        }
        return result
    }
}
