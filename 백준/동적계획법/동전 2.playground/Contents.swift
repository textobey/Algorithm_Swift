import UIKit

func solution() {
    let n = 3
    let k = 15
    let coins = [1, 5, 12]
    var dp = [Int](repeating: 10001, count: 16)
    dp[0] = 0
    
    for i in 0 ..< n {
        // coins[i]의 단위로 coins[i]보다 낮은 가치를 만들어내지 못함
        for j in coins[i] ..< k {
            // min(기존 단위들로 만들수있는 동전의 개수, 새로운 동전 단위가 추가되며 만들수있는 개수)
            dp[j] = min(dp[j], dp[j - coins[i]] + 1)
            print(dp)
        }
    }
    //print(dp)
    //dp[k - 1] != 10001 ? print(dp[k - 1]) : print(-1)
}

solution()
