import UIKit

func solution() {
    let n: Int = 4//Int(readLine()!)!
    var dp: [Int] = [Int](repeating: 0, count: 100001)
    
    // 사자를 한마리도 배치하지 않는 경우도 경우의 수로 치기 때문에
    dp[0] = 1
    // [  ,  ] [ ㅇ ,  ] [  , ㅇ ]
    dp[1] = 3
    
    for i in 2 ..< dp.count {
        // 1칸씩 늘려가면서 그림을 그려보면 규칙을 찾을수가 있음.
        // N=3이라면, N=2일때의 DP값을 가지고 있다. 나머지 2x1칸이 가질수있는 경우의 수는 (완전 공백 제외) 2개
        dp[i] = (dp[i - 1] * 2 + dp[i - 2]) % 9901
    }
    
    print(dp)
    print(dp[n])
}

solution()
