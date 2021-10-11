import UIKit

func solution(_ n: Int) -> Int {
    var dp: [Int] = [Int](repeating: 0, count: 100001)
    dp[0] = 0
    dp[1] = 1
    dp[2] = 2
    dp[3] = 3
    for i in 4 ..< dp.count {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 1234567
    }
    return dp[n - 1]
}

solution(3)
solution(5)
