import Foundation

// input : 토네이도 크기, reverse : 방향(true: 왼쪽, false: 오른쪽)
func solution(input: Int, reverse: Bool) {
    // 토네이도
    var tornado: [[Int]] = Array(repeating: Array(repeating: 0, count: input), count: input)
    
    // 꼭지점
    let vertex = 1
    // firstCursor
    let first = 0
    // lastCursor
    let last = input - 1
    
    func spin(vertex: Int, first: Int, last: Int) {
        // 꼭지점 채워줌
        tornado[first][first] = vertex
        tornado[first][last]  = vertex
        tornado[last][last]   = vertex
        tornado[last][first]  = vertex
        
        // 꼭지점 사이에 들어갈 중간값들
        var middle: [Int] = []
        // 꼭지점 보다 1 큰 수 부터 남은 배열 공간에 맞게 생성함
        middle.append(contentsOf: stride(from: vertex + 1, through: (vertex + 1) + (last - first - 2), by: 1))
        
        // 넣어줄 사이값이 없을때, 재귀 탈출
        if middle.count == 0 {
            return
        }
        
        // 새로운 꼭지점값, middle last값에 +1 해주면 구할수있음
        let newVertex = middle[middle.index(before: middle.endIndex)] + 1
        
        // 반대방향이면 배열 뒤집음
        if reverse {
            middle.reverse()
        }
        
        var indexArray: [Int] = []
        indexArray.append(contentsOf: stride(from: first + 1, through: last - 1, by: 1))
        print(indexArray)
        
        for (m, a) in indexArray.enumerated() {
            // 반대로 회전
            let reverse_a: Int = input - a - 1
            
            // top
            tornado[first][a] = middle[m]
            
            // right
            tornado[a][last] = middle[m]
            
            // bottom
            tornado[last][reverse_a] = middle[m]
            
            // left
            tornado[reverse_a][first] = middle[m]
        }
        
        // 재귀, 시작지점 1칸 종료지점 1칸 줄어듦
        spin(vertex: newVertex, first: first + 1, last: last - 1)
    }
    
    // 회전~회오리~
    spin(vertex: vertex, first: first, last: last)
    
    print(tornado)
}

solution(input: 5, reverse: false)
