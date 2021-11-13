import UIKit

func solution() {
    let n: Int = 8 // Int(readLine()!)!
    var dp: [Int] = [Int](repeating: 0, count: 68)
    dp[0] = 1
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    for i in 4 ..< dp.count {
        dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3] + dp[i - 4]
    }
    
    let t: [Int] = [0, 1, 2, 3, 4, 5, 30, 67]
    
    for i in 0 ..< t.count {
        print(dp[t[i]])
    }
}

solution()
