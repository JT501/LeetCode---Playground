/*:
 ## Two Pointers
 ### Time: O(N1+N2)
 ### Space: O(N1+N2)
 ![submission](1.png)
 */

class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var i = 0, j = 0
        var n1 = nums1.count, n2 = nums2.count
        var ans = [[Int]]()

        while i < n1 && j < n2 {
            let one = nums1[i], two = nums2[j]
            if one[0] == two[0] {
                ans.append([one[0], one[1] + two[1]])
                i += 1
                j += 1
            } else if one[0] < two[0] {
                ans.append(one)
                i += 1
            } else if two[0] < one[0] {
                ans.append(two)
                j += 1
            }
        }

        while i < n1 {
            ans.append(nums1[i])
            i += 1
        }

        while j < n2 {
            ans.append(nums2[j])
            j += 1
        }
     
        return ans
    }
}

/*:
 ## Hashmap + Sort
 ### Time: O((N1+N2)㏒(N1+N2))
 ### Space: O(N1+N2)
 ![submission](2.png)
 */

class Solution2 {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var hashmap = [Int: Int]()
        var ans = [[Int]]()

        for num in nums1 {
            hashmap[num[0], default: 0] += num[1]
        }

        for num in nums2 {
            hashmap[num[0], default: 0] += num[1]
        }

        let ids = hashmap.keys.sorted()

        for id in ids {
            ans.append([id, hashmap[id]!])
        }
     
        return ans
    }
}
