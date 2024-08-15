/*:
 ## Simulation
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var cashInHand = [5:0, 10:0, 20:0]

        for bill in bills {
            switch bill {
                case 5:
                    break
                case 10:
                    if cashInHand[5]! > 0 {
                        cashInHand[5]! -= 1
                    } else {
                        return false
                    }
                case 20:
                    if cashInHand[5]! > 0 && cashInHand[10]! > 0 {
                        cashInHand[5]! -= 1
                        cashInHand[10]! -= 1
                    } else if cashInHand[5]! >= 3 {
                        cashInHand[5]! -= 3
                    } else {
                        return false
                    }
                default:
                    break
            }
            cashInHand[bill]! += 1
        }

        return true
    }
}
