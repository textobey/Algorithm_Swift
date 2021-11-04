import Foundation

func solution() {
    let n: Int = 10
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    var used: [Int] = [Int](repeating: -1, count: n + 1)
    var history: [Int] = [n]
    
    for i in 2 ..< dp.count {
        // dp[i - 1]의 저장된 최소 횟수보다 +1만큼이 많음. 기본적으로
        dp[i] = dp[i - 1] + 1
        // 1로 만드는 과정을 나열하기 위해, 각 연산마다 저장해줌.
        used[i] = i - 1
        // 근데 똑같이 dp[i / 3] + 1해도 최소 횟수를 구할수있음. 뭐가 더 작은지 비교해서 저장함
        if (i % 3 == 0 && dp[i / 3] + 1 < dp[i]) {
            dp[i] = dp[i / 3] + 1
            used[i] = i / 3
        }
        if (i % 2 == 0 && dp[i / 2] + 1 < dp[i]) {
            dp[i] = dp[i / 2] + 1
            used[i] = i / 2
        }
    }
    
    // ex) n = 10
    // used = [-1, -1, 1, 1, 3, 4, 2, 6, 4, 3, 9]
    // used.last = 9
    // used[9] = 3
    // used[3] = 1
    // 9 -> 3 -> 1
    var path: Int = used.last ?? 0
    
    while path > 0 {
        history.append(path)
        path = used[path]
    }
    
    print(used)
    print("\(dp[n])\n\(history.map { String($0) }.joined(separator: " "))")
}

solution()
