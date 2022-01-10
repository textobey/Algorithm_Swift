import Foundation

func solution() {
    let _ = readLine()!
    let slimes = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: >) // 큰 수가 앞에 오도록 정렬
    
    var answer = 0
    var slime = 0 // 슬라임을 더한 값
    
    for i in 0..<slimes.count {
        answer += slime * slimes[i]
        slime += slimes[i]
    }
    
    print(answer)
}

solution()
