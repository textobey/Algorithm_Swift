import Foundation

func 이장님초대() {
    let n = Int(readLine()!)!
    let seedlings = readLine()!.split(separator: " ")
        .compactMap { Int($0) }
        .sorted(by: >) // 오래 걸리는 묘묙 순서대로 정렬한다.
    
    var day = 0
    
    for i in 0..<n {
        day = max(day, seedlings[i] + i + 1) // 심은 날짜와 남은 일수가 앞에서 저장된 최대치보다 큰 경우 교체한다.
    }
    
    print(day + 1)
}
