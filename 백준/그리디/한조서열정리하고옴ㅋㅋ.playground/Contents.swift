import Foundation

func solution() {
    let n = 7
    let mountains = [6, 4, 10, 2, 5, 7, 11]
    
    var maxWinPoint = 0
    
    // 완전탐색
    for i in 0 ..< mountains.count - 1 {
        var winPoint = 0
        for j in i + 1 ..< mountains.count {
            if mountains[i] > mountains[j] {
                winPoint += 1
            }
            else {
                if winPoint > maxWinPoint {
                    maxWinPoint = winPoint
                }
            }
        }
    }
    
    print(maxWinPoint)
}

solution()
