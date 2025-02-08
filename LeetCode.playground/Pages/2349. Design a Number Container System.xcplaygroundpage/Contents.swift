/*:
 ## Hashmap
 ### Time: O(㏒N)
 ### Space: O(N)
 ![submission](1.png)
 */

import Collections

class NumberContainers {
    var indexToNumber = [Int: Int]()
    var numberToIndices = [Int: Heap<Int>]()

    func change(_ index: Int, _ number: Int) {
        indexToNumber[index] = number
        numberToIndices[number, default: Heap()].insert(index)
    }
    
    func find(_ number: Int) -> Int {
        while let index = numberToIndices[number]?.min {
            if indexToNumber[index] == number { return index }
            numberToIndices[number]?.popMin()
        }
        return -1
    }
}

/*:
 ## Hashmap
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */

class NumberContainers2 {
    var numberMap = [Int: Set<Int>]()
    var indexMap = [Int: Int]()

    init() {}
    
    func change(_ index: Int, _ number: Int) {
        if let oldNumber = indexMap[index] {
            numberMap[oldNumber, default: []].remove(index)
        }
        indexMap[index] = number
        numberMap[number, default: []].insert(index)
    }
    
    func find(_ number: Int) -> Int {
        return numberMap[number, default: []].min() ?? -1
    }
}
