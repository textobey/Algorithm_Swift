import UIKit

func solution() {
    let n: Int = Int(readLine()!)!//13
    var dp: [Int] = [Int](repeating: 999999, count: 100001)
    // 2원짜리 1개, 5원짜리는 1개
    dp[2] = 1; dp[5] = 1;
    // 2원짜리 2개
    dp[4] = 2
    
    // 1원, 3원 못거슬러주고 나머지는 거슬러줄수있기 때문에 위에서 설정해주고, 6원부터 시작
    for i in 6 ..< dp.count {
        // min(2원으로 거슬러주기, 5원으로 거슬러주기) + 1
        dp[i] = min(dp[i - 2], dp[i - 5]) + 1
    }
    print(dp[n] == 999999 ? print(-1) : print(dp[n]))
}

solution()
