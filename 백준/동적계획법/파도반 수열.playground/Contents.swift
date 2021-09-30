import UIKit

func solution() {
    let n: Int = Int(readLine()!)!
    var nums: [Int] = []
    for _ in 0 ..< n {
        nums.append(Int(readLine()!)!)
    }
    
    var dp: [Int] = [Int](repeating: 0, count: 101)
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    dp[4] = 2
    dp[5] = 2
    dp[6] = 3
    
    for i in 7 ..< dp.count {
        dp[i] = dp[i - 3] + dp[i - 4] + dp[i - 5]
    }
    
    for num in nums {
        print(dp[num])
    }
}

solution()
