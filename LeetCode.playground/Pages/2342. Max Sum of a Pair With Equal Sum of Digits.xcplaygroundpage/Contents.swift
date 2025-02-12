/*:
 ## Hashmap
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var digitSumDict = [Int: Int]()
        var ans = -1

        for num in nums {
            let digitSum = digitSum(num)
            if let previousNum = digitSumDict[digitSum] {
                ans = max(ans, previousNum + num)
                digitSumDict[digitSum] = max(previousNum, num)
            } else {
                digitSumDict[digitSum] = num
            }
        }

        return ans
    }

    func digitSum(_ num: Int) -> Int {
        var num = num
        var sum = 0

        while num != 0 {
            sum += num % 10
            num /= 10
        }

        return sum
    }
}

/*:
 ## Hashmap + Sorting
 ### Time: O(N㏒N)
 ### Space: O(N)
 ![submission](2.png)
 */

class Solution2 {
    func maximumSum(_ nums: [Int]) -> Int {
        var digitSumDict = [Int: [Int]]()
        var maximun = -1

        for num in nums {
            digitSumDict[digitSum(num), default: []].append(num)
        }

        let d = digitSumDict.filter( { $1.count > 1})
        for (key, value) in d {
            let sorted = value.sorted()
            maximun = max(maximun, sorted.suffix(2).reduce(0, +))
        }

        return maximun
    }

    func digitSum(_ num: Int) -> Int {
        var num = num
        var sum = 0

        while num != 0 {
            sum += num % 10
            num /= 10
        }

        return sum
    }
}
