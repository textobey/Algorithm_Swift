import UIKit

func solution() {
    let n: Int = 2 //Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
    for i in 0 ..< 10 {
        dp[0][i] = 1
    }
    for i in 1 ..< dp.count {
        dp[i][0] = 1
        print(dp)
        for j in 1 ..< 10 {
            dp[i][j] = (dp[i][j - 1] + dp[i - 1][j]) % 10007
            print(dp)
        }
    }
    //print(dp)
    //print(dp.last?.last)
}

solution()
