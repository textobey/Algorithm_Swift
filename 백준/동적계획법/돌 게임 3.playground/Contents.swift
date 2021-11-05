import UIKit

func solution() {
    let n: Int = 6 //Int(readLine()!)!
    var dp: [String] = [String](repeating: "", count: 1001)
    
    for i in 1 ..< dp.count {
        // 돌을 1개씩 추가해보면서 상황을 보면,
        // 주어진 n의 -1을 하고 그를 7로 나누어 나머지가 0 또는 2면 창영이가 이기고,
        // 그 밖의 상황은 상근이가 모두 이긴다는 것을 확인 할 수 있다.
        let condition: Bool = (i - 1) % 7 == 0 || (i - 1) % 7 == 2
        dp[i] = condition ? "CY" : "SK"
    }
    
    print(dp[n])
}

solution()
