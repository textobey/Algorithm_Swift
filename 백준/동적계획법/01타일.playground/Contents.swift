import UIKit

func solution() {
    let n: Int = Int(readLine()!)!
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    dp[0] = 0
    dp[1] = 1 // 1
    dp[2] = 2 // 00, 11
    dp[3] = 3 // 001, 100, 111
    dp[4] = 5 // 0011, 1100, 1001, 1111, 0000
    dp[5] = 8 // 00001, 10000, 00100, 11100, 00111, 10011, 11001, 11111
    dp[6] = 13 // 000000, 000011, 001100, 110000, 100001, 100100, 001001,
               // 001111, 111100, 100111, 111001, 110011, 111111
    guard n >= 7 else { return print(dp[n]) }
    for i in 7 ..< dp.count {
        dp[i] = (dp[i - 2] + dp[i - 1]) % 15746
    }
    print(dp[n])
}

solution()
