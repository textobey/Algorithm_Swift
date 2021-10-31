import Foundation

func solution() {
    //let n: Int = Int(readLine()!)!
    //let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let nums: [Int] = [10, 30, 10, 20, 20, 10]
    // 감소하는 시퀀스가 나오지 않아도, 자기 자신만으로 1이 일단 만족됨
    var dp: [Int] = [Int](repeating: 1, count: nums.count)
    
    for i in 1 ..< dp.count {
        for j in 0 ..< i {
            // 이전 숫자가 다음 숫자보다 낮으면 조건이 만족됨
            if nums[j] > nums[i] {
                // 각 길이(인덱스)에서 나올수있는 최대 길이를 dp에 저장
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!)
}

solution()
