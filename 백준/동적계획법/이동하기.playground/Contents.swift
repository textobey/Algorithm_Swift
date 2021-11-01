import UIKit

func solution() {
    let n: Int = 4
    let m: Int = 3
    let candys: [[Int]] = [
        [1, 2, 3],
        [6, 5, 4],
        [7, 8, 9],
        [12, 11, 10]
    ]

    // 미로의 밖으로 벗어난 영역부터 찾을수없기 때문에 [0, 0, 0, 0...] 배열을 임의로 만들어 놓고
    var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

    // index 1부터 탐색
    for i in 1 ... n {
        for j in 1 ... m {
            // 중요한점은 최대로 얻을수있는 사탕의 개수를 구할수 있기 때문에, 아래와 같은 점화식을 만든다.
            // max(오른쪽을 거쳐서 아래로 이동, 아래쪽으로 이동후 오른쪽으로 이동) > 대각선으로 바로 이동
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) + candys[i - 1][j - 1]
        }
    }

    print(dp[n][m])
}

solution()
