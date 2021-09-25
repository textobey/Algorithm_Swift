import Foundation

func solution() {
    let _: Int = Int(readLine()!)! //10
    let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! } //[10, -4, 3, 1, 5, 6, -35, 12, 21, -1]
    
    if nums.max()! < 0 {
        // 최대값이 음수인경우에는 계속 더해봤자 숫자가 더 작아지기만 함
        print(nums.max()!)
        return
    }
    
    var dp: (current: Int, result: Int) = (0, 0)
    
    for num in nums {
        // current에 계속 더해나감
        dp.current += num
        if dp.current < 0 {
            // 0보다 작거나 같아지는 순간 이후로는 아무리 값을 더해나가봤자 최대값이 될 수 없음
            // 그렇기 때문에 current를 0으로 바꿈
            dp.current = 0
        }
        if dp.current > dp.result {
            dp.result = dp.current
        }
    }
    
    print(dp.result)
}

solution()
