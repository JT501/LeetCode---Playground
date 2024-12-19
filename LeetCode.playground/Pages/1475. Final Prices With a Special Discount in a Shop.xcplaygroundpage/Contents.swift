/*:
 ## Monotonic Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        // Monotonic stack to store indices of items
        var monoStack: [Int] = []
        // Create a new array to store the result
        var result = prices

        // Iterate through prices with index and value
        for (i, price) in prices.enumerated() {
            // While the stack is not empty and the current price is less than or equal
            // to the price at the index stored at the top of the stack
            while !monoStack.isEmpty && price <= prices[monoStack.last!] {
                // Apply the discount
                result[monoStack.popLast()!] -= price
            }
            // Push the current index onto the stack
            monoStack.append(i)
        }

        return result
    }
}

let s = Solution()

s.finalPrices([8, 4, 6, 2, 3])
s.finalPrices([1, 2, 3, 4, 5])
