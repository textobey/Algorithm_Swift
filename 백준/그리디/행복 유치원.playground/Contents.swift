import Foundation

func solution() {
    // 1. 변화량 저장
    // 2. 내림차순 정렬
    // 3. teamCount - 1개만큼 큰수를 제외
    let input = "5 3".split(separator: " ").map { Int($0) }
    let manCount = input[0]!
    let teamCount = input[1]!
    
    let heights = [1, 3, 5, 6, 10]
    var temp: [Int] = [Int]()
    
    for i in 0 ..< manCount - 1 {
        temp.append(abs(heights[i] - heights[i + 1]))
    }
    
    temp.sort(by: >)
    
    (0 ..< teamCount - 1).forEach { _ in
        temp.removeFirst()
    }
    
    print(temp.reduce(0, +))
}

solution()
