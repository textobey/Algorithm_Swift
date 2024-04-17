//
//  2468_안전영역.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/17.
//

import Foundation

// 2468 안전 영역

func solution() {
    let n: Int = Int(readLine()!)!
    
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 4), count: n + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 4), count: n + 4)
    
    var inputs: [[Int]] = []
    
    var mountainMaxHeight = 0
    
    var result: [Int] = []
    
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        inputs.append(input)
        
        mountainMaxHeight = max(mountainMaxHeight, input.max()!)
    }
    
    // graph 채우기
    for i in 0 ..< inputs.count {
        for j in 0 ..< inputs[i].count {
            graph[i + 1][j + 1] = inputs[i][j]
        }
    }
    
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    // bfs 구현
    func bfs(_ coordinate: Coordinate, testCaseHeight: Int) {
        var queue: [Coordinate] = [coordinate]
        visited[coordinate.y][coordinate.x] = true
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            
            for i in 0 ..< 4 {
                let newX = element.x + directionRow[i]
                let newY = element.y + directionColum[i]
                
                if graph[newY][newX] > testCaseHeight && !visited[newY][newX] {
                    queue.append(Coordinate(x: newX, y: newY))
                    visited[newY][newX] = true
                    // Point. 여기서 확인할수 있는건 if문을 충족하는 node의 개수
                    // 즉, 아래에서 safeArea를 안구하고 여기서 계산하면 노드들의 연이어진 "크기"를 구할수있음
                    // 또, 특정 노드끼리의 depth를 파악할수있음(단, visited를 2차원배열로 하면안됨)
                }
            }
        }
    }
    
    // answer 구현
    // 0부터 시작해야함. 문제 지문에 "아무 지역도 물에 잠기지 않을 수 있다"
    for testCaseHeight in 0 ... mountainMaxHeight {
        var safeAreaCount: Int = 0
        visited = Array(repeating: Array(repeating: false, count: n + 4), count: n + 4)
        
        for i in 1 ... n {
            for j in 1 ... n {
                if graph[j][i] > testCaseHeight && !visited[j][i] {
                    bfs(Coordinate(x: i, y: j), testCaseHeight: testCaseHeight)
                    // 조건을 만족하는 노드의 "개수"를 구할수있음
                    safeAreaCount += 1
                }
            }
        }
        
        result.append(safeAreaCount)
    }
    
    print(result.max() ?? 0)
}

solution()

//5
//6 8 2 6 2
//3 2 3 4 6
//6 7 3 3 2
//7 2 5 3 6
//8 9 5 2 7
//result 5

//    var inputs: [[Int]] = [
//        [6, 8, 2, 6, 2],
//        [3, 2, 3, 4, 6],
//        [6, 7, 3, 3, 2],
//        [7, 2, 5, 3, 6],
//        [8, 9, 5, 2, 7]
//    ]
//
//    var inputs: [[Int]] = [
//        [9, 9, 9, 9, 9, 9, 9],
//        [9, 2, 1, 2, 1, 2, 9],
//        [9, 1, 8, 7, 8, 1, 9],
//        [9, 2, 7, 9, 7, 2, 9],
//        [9, 1, 8, 7, 8, 1, 9],
//        [9, 2, 1, 2, 1, 2, 9],
//        [9, 9, 9, 9, 9, 9, 9]
//    ]

