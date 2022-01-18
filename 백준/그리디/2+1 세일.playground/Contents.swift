import Foundation

func solution() {
    let n = 6//Int(readLine()!)!
    var milks: [Int] = [6, 4, 5, 5, 5, 5]
    
    milks.sort(by: >)
    
    var result = 0
    
    // 내림차순 정렬 후 index를 3으로 나누었을때, 나머지가 2인것을 포함하지 않으면 최소비용임
    for i in 0 ..< milks.count {
        if i % 3 != 2 {
            result += milks[i]
        }
    }
    
    print(result)
}

solution()
