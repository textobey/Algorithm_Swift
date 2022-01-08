import PlaygroundSupport
import UIKit

func solution() {
    //let n = 4
    let nums = [100, 200, 12345, 1003]
    
    var fibo: [Int] = [Int](repeating: 0, count: 45)
    fibo[0] = 0
    fibo[1] = 1
    fibo[2] = 2
    fibo[3] = 3

    for i in 4 ..< fibo.count {
        fibo[i] = (fibo[i - 1] + fibo[i - 2])
    }
    
    for i in 0 ..< nums.count {
        var input = nums[i]
        var result: [String] = []
        // reverse로 큰수부터 찾아들어감, 0은 생략
        for j in (0 ..< fibo.count).reversed() {
            if input >= fibo[j] && input > 0 {
                result.append("\(fibo[j])")
                input -= fibo[j]
            }
        }
        
        print(result.reversed().joined(separator: " "))
    }
}

solution()
