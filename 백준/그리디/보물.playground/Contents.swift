import UIKit

// 1 1 3
// 10 30 20

// 10 20 30
// 3 1 1

// 1 2 3 7 8
// 6 1 1 1 0

// 6 + 2 + 3 + 7 + 0
// 8 11 18

func solution() {
    let n: Int = 9 //Int(readLine()!)!
    let a: [Int] = [5, 15, 100, 31, 39, 0, 0, 3, 26]
    let b: [Int] = [11, 12, 13, 2, 3, 4, 5, 9, 1]
    
    let sortedA: [Int] = a.sorted(by: >)
    // B를 재배치 시키면 안된다고 했지만, 사실 A배열을 해당 순서에 맞게 옮겼다고만 볼수있다.
    // 정답을 출력하는데에는 아무런 지장이 없다.
    let sortedB: [Int] = b.sorted(by: <)
    
    var result: Int = 0
    
    for i in 0 ..< n {
        let num = sortedA[i] * sortedB[i]
        result += num
    }
    
    print(result)
}

solution()

// 528
