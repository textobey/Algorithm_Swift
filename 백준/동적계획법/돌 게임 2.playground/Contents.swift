import UIKit

func solution() {
    let n: Int = 4 //Int(readLine()!)!
    var dp: [String] = [String](repeating: "", count: 1001)
    for i in 1 ..< dp.count {
        dp[i] = i % 2 == 0 ? "SK" : "CY"
    }
    print(dp)
}

solution()
