import UIKit

func solution() {
    //let n = Int(readLine()!)!
    //let m = Int(readLine()!)!
    //var array = [[Int]]()
    //for _ in 0 ..< 2 {
    //    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    //    array.append(nums)
    //}
    //let dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n)
    
    let array = [[50, 10, 100, 20, 40], [30, 50, 70, 10, 60]]
    var dp = Array(repeating: Array(repeating: 0, count: array[0].count + 1), count: 2)
    dp[0][1] = array[0][0]
    dp[1][1] = array[1][0]
    
    for i in 2 ..< dp[0].count {
        dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + array[0][i - 1]
        dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + array[1][i - 1]
    }
    
    print(dp)
    print(max(dp[0].max()!, dp[1].max()!))
}

solution()
