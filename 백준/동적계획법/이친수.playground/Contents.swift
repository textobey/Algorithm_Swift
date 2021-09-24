import UIKit

func solution() {
    let n: Int = Int(readLine()!)! //3
    var dp: [Int] = [Int](repeating: 0, count: 91)
    
    dp[0] = 1 // 1
    dp[1] = 1 // 10
    dp[2] = 2 // 100, 101
    dp[3] = 3 // 1000, 1010, 1001
    //dp[4] = 5  // 10000, 10100, 10101, 10010, 10001
    
    for i in 4 ..< dp.count {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    
    print(dp[n - 1])
}

solution()
