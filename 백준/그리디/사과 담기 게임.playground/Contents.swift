import Foundation

func solution() {
    let n = 5 //readLine()!.split(separator: " ").map { Int(String($0))! }
    var start = 0
    var end = 0 //n[1] - 1
    
    // apple count
    let j = Int(readLine()!)!
    
    var positions = [1, 5, 3]
    var count = 0
    
    for position in positions {
        // 사과가 떨어지는 위치가 현재 바구니가 위치한 범주안에 포함됨
        if start <= position && position <= end {
            continue
        }
        // 사과가 떨어지는 위치가 현재 바구니의 위치보다 왼쪽일 경우
        else if start > position {
            while start != position {
                start -= 1
                end -= 1
                count += 1
            }
        }
        // 사과가 떨어지는 위치가 현재 바구니의 위치보다 오른쪽일 경우
        else if end < position {
            while end != position {
                start += 1
                end += 1
                count += 1
            }
        }
    }
    
    print(count)
}

solution()
