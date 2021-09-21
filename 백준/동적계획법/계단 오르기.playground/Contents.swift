import UIKit

/**
 한 칸 오른 후에는 무조건 두 칸을 올라야 한다.
 두 칸을 오른 경우 한 칸 오른 것과 두 칸 오른 경우중 큰 수를 더한다.
 한 칸 배열에는 한개 전에 오른 두 칸의 점수를 계속 더하게 되고,
 두 칸 배열에는 두개 전 오른 한 칸 배열과 두 칸 배열 중 큰 수를 저장하게 된다.
 
 - 한 칸
 두 칸[n - 1]
 n = n - 1 + n
 
 - 두칸
 한 칸[n - 2]과 두 칸[n - 2] 중 큰 수를 더한다.
 n = max(한 칸[n - 2], 두 칸[n - 2]) + n
 */

import Foundation

func solution() {
    // 총 계단의 수
    let n = Int(readLine()!)!
    var dp = Array(repeating: (0, 0), count: n) // (한 칸, 두 칸)
    
    for i in 0 ..< n {
        // 계단의 점수
        let stair = Int(readLine()!)!

        if i - 1 >= 0 {
            // 오르기 직전 두칸 오른 점수와 합하여 저장한다.
            dp[i].0 = dp[i - 1].1 + stair
        }
        else {
            // 첫 칸은 무조건 첫 점수를 저장
            dp[i].0 = stair
        }
        
        if i - 2 >= 0 {
            // 두 칸 전 점수를 저장한다.
            dp[i].1 = max(dp[i - 2].0, dp[i - 2].1) + stair
        }
        else {
            // i가 세번째가 되기 전까지는 그대로 저장한다.
            dp[i].1 = stair
        }
    }
    
    print(max(dp[n - 1].0, dp[n - 1].1))
}

solution()
