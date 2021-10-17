import UIKit

func solution() {
    let n = 3
    let k = 10
    let coins: [Int] = [1, 2, 5]
    
    var dp = [Int](repeating: 0, count: k + 1)
    dp[0] = 1
    
    print(dp)
    for i in 0 ..< n {
        for j in i ..< dp.count {
            // 예를 들어, 현재 동전이 2원짜리이면 2원짜리로 1원을 만들수는 없음. -> else로 빠짐
            // (j - 1 or 2 or 5 >= 0)
            if j - coins[i] >= 0 {
                // 새로운 동전의 단위가 적용 가능하기 때문에, 새 동전 단위 사용하는 경우 더해줌.
                dp[j] = dp[j] + dp[j - coins[i]]
            } else {
                dp[j] = dp[j]
            }
        }
    }
}

solution()
