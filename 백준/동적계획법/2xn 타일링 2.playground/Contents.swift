import UIKit

func solution() {
    let n: Int = Int(readLine()!)!
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    if n == 1 {
        print(1)
        return
    } else if n == 2 {
        print(3)
        return
    } else if n == 3 {
        print(5)
        return
    }
    dp[1] = 1
    dp[2] = 3
    dp[3] = 5
    
    for i in 4 ..< dp.count {
        dp[i] = (dp[i - 1] + (2 * dp[i - 2])) % 10007
    }
    
    print(dp[n])
}

solution()
