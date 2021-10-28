import UIKit

func solution() {
    //let n: Int = 10//Int(readLine()!)!
    let nums: [Int] = [1, 100, 2, 50, 60, 3, 5, 6, 7, 8]
    var dp: [Int] = [Int](repeating: 0, count: nums.count)
    
    for i in 0 ..< dp.count {
        // nums[i]값을 dp에 전달
        dp[i] = nums[i]
        // 하나씩 비교하며, 가장 큰 증가하는수를 구함
        for j in 0 ..< i {
            // 증가해야한다는 조건이 있기때문에, 뒷값이 앞값보다 커야함
            if nums[i] > nums[j] {
                dp[i] = dp[i] < (dp[j] + nums[i]) ? dp[j] + nums[i] : dp[i]
            }
        }
    }
    print(dp.max()!)
}

solution()
