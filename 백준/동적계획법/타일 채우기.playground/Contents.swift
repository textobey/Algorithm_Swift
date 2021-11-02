import Foundation

func solution() {
    let n: Int = Int(readLine()!)!
    // dp[i]가 홀수일때는, 1x1의 빈칸이 생기기 때문에 전부 채우지 못함. => 0
    var dp: [Int] = [Int](repeating: 0, count: 31)
    
    dp[0] = 1
    dp[2] = 3

    guard n >= 4 else {
        print(dp[n])
        return
    }
    
    for i in 4 ..< dp.count {
        // 이전 짝수[i - 2]에 도형 3가지 케이스가 추가 되기 때문에, x3
        dp[i] = dp[i - 2] * 3
        for j in 4 ... i {
            // 4이상부터의 짝수(4..6..8..10...)에서는 놓을수있는 새로운 도형 2가지가 추가 되기 때문에, x2
            guard j % 2 == 0 else { continue }
            dp[i] += dp[i - j] * 2
        }
    }
    
    print(dp[n])
}

solution()
