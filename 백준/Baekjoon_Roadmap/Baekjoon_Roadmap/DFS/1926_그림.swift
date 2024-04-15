//
//  1926_그림.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/15/24.
//

import Foundation

// 1926 그림

func solution() {
    let sizeInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let height: Int = sizeInput[0]
    let width: Int = sizeInput[1]
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
    
//    let input: [[Int]] = [
//        [1, 1, 0, 1, 1],
//        [0, 1, 1, 0, 0],
//        [0, 0, 0, 0, 0],
//        [1, 0, 1, 1, 1],
//        [0, 0, 1, 1, 1],
//        [0, 0, 1, 1, 1]
//    ]
    
//    let input: [[Int]] = [
//        [0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0]
//    ]
    
    var inputs: [[Bool]] = []
    
    var count: Int = 0
    var sizes: [Int] = []
    
    // graph 채우기
    for _ in 0 ..< height {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }.map { $0 == 1 }
        inputs.append(input)
    }
    
    for i in 0 ..< height {
        for j in 0 ..< width {
            graph[i + 1][j + 1] = inputs[i][j]
        }
    }
    
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    // dfs 구현
    func dfs(x: Int, y: Int) {
        visited[y][x] = true
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if graph[newY][newX] && !visited[newY][newX] {
                sizes[sizes.endIndex - 1] += 1
                dfs(x: newX, y: newY)
            }
        }
    }
    
    for i in 1 ... width {
        for j in 1 ... height {
            if graph[j][i] && !visited[j][i] {
                count += 1
                sizes.append(1)
                dfs(x: i, y: j)
            }
        }
    }
    
    // answer 구현
    //print(count, sizes.max() ?? 0, terminator: " ")
    print(count)
    print(sizes.max() ?? 0)
}

solution()
