import Foundation

func solution() {
    let readLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = readLine[0]
    let k = readLine[1]
    var dp: [[Int]] = Array(repeating: Array(repeating: 1, count: 1001), count: 1001)
        
    if k == 0 || n == k {
        print(1)
        return
    } else if k == 1 {
        print(n)
        return
    }

    for i in 1 ... n {
        for j in 1 ... i {
            if j == 0 || i == j {
                dp[i][j] = 1
            } else {
                // 이항계수 문제이기 때문에, nCk = (n-1Cr-1) + (n-1Cr)이 성립된다.
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j]) % 10007
            }
        }
    }
    
    print(dp[n][k])
}

solution()

