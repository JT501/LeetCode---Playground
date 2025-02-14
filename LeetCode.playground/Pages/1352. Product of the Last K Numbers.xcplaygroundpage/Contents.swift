/*:
 ##
 ### Time: O(1)
 ### Space: O(N)
 ![submission](1.png)
 */

class ProductOfNumbers {
    private var products: [Int]

    init() {
        products = []
    }
    
    func add(_ num: Int) {
        if num == 0 {
            products = []
        } else {
            products.append((products.last ?? 1) * num)
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        if k > products.count {
            return 0
        } else if k == products.count {
            return products.last!
        } else {
            return products.last! / products[products.count - k - 1]
        }
    }
}

/*:
 ##
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */

class ProductOfNumbers2 {
    private var stack: [Int]

    init() {
        stack = []
    }
    
    func add(_ num: Int) {
        stack.append(num)
    }
    
    func getProduct(_ k: Int) -> Int {
        let n = stack.count
        let lastK = stack.dropFirst(n - k)
        return lastK.reduce(1, *)
    }
}
