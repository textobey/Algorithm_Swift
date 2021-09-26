import UIKit

func solution() {
    let n: Int = Int(readLine()!)!
    var wines = [Int](repeating: 0, count: n + 1)
    var dp = wines
    
    for i in 1 ... n {
        wines[i] = Int(readLine()!)!
    }
    
    if n == 1 {
        print(wines[1])
        return
    } else if n == 2 {
        print(wines[1] + wines[2])
        return
    }
    
    dp[1] = wines[1]
    dp[2] = wines[1] + wines[2]
    
    // 3번째 이상에서 최대로 마실수있는 양을 찾을때에는 3가지 경우가 있다.
    // 1. n번째 잔을 마시지 않은 경우
    // 2. n번째 잔을 마심으로 인해, 연속 1번으로 마셨다고 가정하는 경우
    // 3. n번째 잔을 마심으로 인해, 연속 2번으로 마셨다고 가정하는 경우
    for i in 3 ... n {
        // n번째 잔을 마시지 않은 경우로 시작
        var maxDrink = dp[i - 1]
        // max(n번째 잔을 마시지 않은 경우, n번째 잔을 연속 1번으로 마신 경우)
        maxDrink = max(maxDrink, dp[i - 2] + wines[i])
        // max(maxDrink, n번째 잔을 연속 2번으로 마신 경우)
        maxDrink = max(maxDrink, dp[i - 3] + wines[i - 1] + wines[i])
        // 3...n까지 차례로 돌면서, 해당 차례까지 마셨을 경우의 최대치를 저장함
        dp[i] = maxDrink
    }
    
    print(dp[n])
}

solution()
