/*:
 ## Binary Search
 ### Time: O(㏒ N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0, right = arr.count - 1
        var boundary = -1

        while left <= right {
            let mid = left + (right - left) / 2

            if arr[mid] > arr[mid + 1] {
                right = mid - 1
                boundary = mid
            } else if arr[mid] < arr[mid + 1] {
                left = mid + 1
            }
        }
        return boundary
    }
}
