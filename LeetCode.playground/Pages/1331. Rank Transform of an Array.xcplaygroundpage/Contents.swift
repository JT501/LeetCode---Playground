/*:
 ### Time: O(n㏒n)
 ### Space: O(n)
 ![submission](1.png)
 */

class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let sorted = arr.sorted()
        var hashmap = [Int:Int]()
    
        for num in sorted {
            if hashmap[num] == nil {
                hashmap[num] = hashmap.count + 1
            }
        }

        return arr.map { hashmap[$0]! }
    }
}
