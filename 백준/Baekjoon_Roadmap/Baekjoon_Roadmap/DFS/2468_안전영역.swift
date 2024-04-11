//
//  2468_안전영역.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/11/24.
//

import Foundation

// 2468 안전 영역

func solution() {
    let n: Int = Int(readLine()!)!
    
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 4), count: n + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 4), count: n + 4)
    
    var inputs: [[Int]] = []
    
    var mountainMaxHeight = 0
    var mountainMinHeight = 101
    
    var result: [Int] = []
    
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        inputs.append(input)
        
        mountainMaxHeight = max(mountainMaxHeight, input.max()!)
        mountainMinHeight = min(mountainMinHeight, input.min()!)
    }
    
    // graph 채우기
    for i in 0 ..< inputs.count {
        for j in 0 ..< inputs[i].count {
            graph[i + 1][j + 1] = inputs[i][j]
        }
    }
    
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    // dfs 구현
    func dfs(x: Int, y: Int, testCaseHeight: Int) {
        visited[y][x] = true
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if graph[newY][newX] > testCaseHeight && !visited[newY][newX] {
                dfs(x: newX, y: newY, testCaseHeight: testCaseHeight)
            }
        }
    }
    
    // answer 구현
    // 0부터 시작해야함. 문제 지문에 "아무 지역도 물에 잠기지 않을 수 있다"
    for testCaseHeight in 0 ... mountainMaxHeight {
        var safeArea = 0
        visited = Array(repeating: Array(repeating: false, count: n + 4), count: n + 4)
        
        for i in 0 ..< n + 1 {
            for j in 0 ..< n + 1 {
                let mountainHeight = graph[j][i]
                
                if mountainHeight > testCaseHeight && !visited[j][i] {
                    dfs(x: i, y: j, testCaseHeight: testCaseHeight)
                    safeArea += 1
                }
            }
        }
        
        result.append(safeArea)
    }
    
    print(result.max() ?? 1)
}

solution()

//5
//6 8 2 6 2
//3 2 3 4 6
//6 7 3 3 2
//7 2 5 3 6
//8 9 5 2 7
//2

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
