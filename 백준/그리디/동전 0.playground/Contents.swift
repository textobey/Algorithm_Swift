import UIKit

func solution() {
    //let input = readLine()!.split(separator: " ")
    //let n: Int = Int(input[0])!
    //let k: Int = Int(input[1])!
    
    let n = 10
    var price = 4790 // 4200
    let coins: [Int] = [1, 5, 10, 50, 100, 500, 1000, 5000, 10000, 50000]
    
    var count: Int = 0
    
    for i in (0 ..< coins.count).reversed() {
        while price >= coins[i] {
            price -= coins[i]
            count += 1
        }
        if price == 0 {
            break
        }
    }
    
    print(count)
}

solution()
