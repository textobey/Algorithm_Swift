import Foundation

func solution() {
    let n: Int = Int(readLine()!)! //6
    let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! } //[10, 20, 10, 30, 20, 50]
    // 전부 1로 요소들을 채움 [1, 1, 1, 1, 1, 1]
    var dp = [Int](repeating: 1, count: n)
    
    for i in 1 ..< n {
        for j in 0 ..< i {
            // 이전 요소들을 확인함. 이전 요소보다 nums[i]가 크면
            if nums[i] > nums[j] {
                // 해당 dp index에 +1씩 해나감
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!)
}

solution()
