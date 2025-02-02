/*:
 ## Array
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        let newNums = nums + nums
        var count = 1

        guard n > 1 else { return true }

        for i in 1..<(2*n) {
            if newNums[i] >= newNums[i-1] {
                count += 1
            } else {
                count = 1
            }
            if count == n {
                return true
            }
        }

        return false
    }
}

/*:
 ## Array
 ### Time: O(N*㏒N)
 ### Space: O(N)
 ![submission](2.png)
 */

class Solution2 {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        let sorted = nums.sorted()
        
        return (nums+nums).contains(sorted)
    }
}

/*:
 ## Array
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](3.png)
 */

class Solution3 {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        let sorted = nums.sorted()

        for (i, num) in nums.enumerated() {
            let rotated = nums[i+1..<n] + nums[0...i]
            if Array(rotated) == sorted {
                return true
            }
        }
        
        return false
    }
}
