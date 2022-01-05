import Foundation

func solution() {
    let n = readLine()!.split(separator: " ").compactMap { Int($0) }
    let fruit = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: <) // 낮은 과일순으로 정렬
    var length = n[1] // 뱀의 길이
    
    for i in 0..<n[0] {
        if length < fruit[i] { break }
        length += 1
    }
    
    print(length)
}

solution()
