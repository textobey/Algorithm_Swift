import Foundation

func solution() {
    let n = 3
    var cow: [[Int]] = []
    let times = ["2 1", "8 3", "5 7"]
    
    for i in 0 ..< times.count {
        cow.append(times[i].split(separator: " ").map { Int($0)! })
    }
    // 도착시간을 기준으로 오름차순 정렬
    cow.sort { $0[0] < $1[0] }
    
    var time = 0
    for i in 0 ..< cow.count {
        // 대기 시간이 필요한 경우, 검문 시간만 추가함
        if time > cow[i][0] {
            time += cow[i][1]
        }
        // 대기 시간이 필요 없는 경우, 도착/검문 시간 추가
        else {
            time = cow[i][0] + cow[i][1]
        }
    }
    print(time)
}

solution()
