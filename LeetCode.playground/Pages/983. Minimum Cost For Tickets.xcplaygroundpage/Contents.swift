/*:
 ## DP (Bottom-Up)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var minByDay = Array(repeating: 0, count: days.last! + 1)
        var prevDay = 0

        for day in days {
            // If not consecutive day
            if day - prevDay > 1 {
                for d in (prevDay+1)..<day {
                    minByDay[d] = minByDay[prevDay]
                }
            }
            if day < 7 {
                minByDay[day] = min(minByDay[day-1]+costs[0], costs[1], costs[2])
            } else if day < 30 {
                minByDay[day] = min(minByDay[day-1]+costs[0], minByDay[day-7]+costs[1], costs[2])
            } else {
                minByDay[day] = min(minByDay[day-1]+costs[0], minByDay[day-7]+costs[1], minByDay[day-30]+costs[2])
            }
            prevDay = day
        }

        return minByDay.last ?? 0
    }
}
