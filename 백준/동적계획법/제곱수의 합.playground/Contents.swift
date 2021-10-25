import UIKit

func solution() {
    let n: Int = 7//Int(readLine()!)!
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    dp[0] = 0
    dp[1] = 1 // 1의2승
    dp[2] = 2 // 1의2승, 1의2승
    dp[3] = 3 // 1의2승, 1의2승, 1의2승
    //dp[4] = 1 // 1의2승, 1의2승, 1의2승, 1의2승 -> 4개 또는 2의2승 -> 1개
    
    for i in 4 ..< dp.count {
        dp[i] = i
        for j in 2 ... Int(sqrt(Double(i))) {
            dp[i] = min(dp[i], dp[i - (j * j)] + 1)
        }
    }
    
    print(dp[n])
}

solution()
