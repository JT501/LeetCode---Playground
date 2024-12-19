/*:
 ## Maximum Element
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var maxSoFar = 0
        var chunks = 0

        // Iterate through the array with index and value
        for (i, num) in arr.enumerated() {
            // Update maxSoFar to track the largest number seen so far
            maxSoFar = max(num, maxSoFar)

            // If the current index matches maxSoFar, a valid chunk is found
            if i == maxSoFar {
                chunks += 1
            }
        }

        // Return the total number of chunks
        return chunks
    }
}

/*:
 ## Monotonic Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */

class Solution2 {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var stack: [Int] = []

        for num in arr {
            // If the stack is not empty and the current value is smaller than the top of the stack
            if let top = stack.last, num < top {
                // Merge chunks
                let maxInChunk = stack.removeLast()
                while let last = stack.last, num < last {
                    stack.removeLast()
                }
                // Push the maximum value of the merged chunk
                stack.append(maxInChunk)
            } else {
                // Push the current value onto the stack
                stack.append(num)
            }
        }

        // The size of the stack represents the number of chunks
        return stack.count
    }
}
