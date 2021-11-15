import Foundation

func solution() {
    /*
    let n: Int = Int(readLine()!)!
    var coins: [[Int]] = [[Int]]()
    var prices: [Int] = [Int]()
    var dp: [[Int]] = [[Int]]()
    
    for _ in 0 ..< n {
        let _ : Int = Int(readLine()!)!
        let readLineCoins: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        let readLinePrice: Int = Int(readLine()!)!
        var readLineDp: [Int] = [Int](repeating: 0, count: readLinePrice + 1)
        readLineDp[0] = 1
        coins.append(readLineCoins)
        prices.append(readLinePrice)
        dp.append(readLineDp)
    }
    */
    
    let coins: [Int] = [1, 5, 10]
    let price: Int = 100
    var dp: [Int] = [Int](repeating: 0, count: price + 1)
    dp[0] = 1
    
    for i in 0 ..< coins.count {
        for j in i ..< dp.count {
            if (j - coins[i]) >= 0 {
                // coins[i]가 추가됨으로 인해 새로운 경우의 수가 추가됨
                dp[j] = dp[j] + dp[j - coins[i]]
            }
            // (j - coins[i]) >= 0이라면, coins[i]보다 낮은 가치를 만들수없기 때문에, 경우의수가 같음
            else {
                dp[j] = dp[j]
            }
        }
    }
    
    print(dp[price])
}

solution()
