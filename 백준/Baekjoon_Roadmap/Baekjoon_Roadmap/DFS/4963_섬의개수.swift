//
//  4963_섬의개수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/8/24.
//

import Foundation

// 4963 섬의 개수

func solution() {
    var result: [Int] = []
    
    loop: while true {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if input[0] == 0 && input[1] == 0 {
            break loop
        }
        result.append(innerSolution(m: input[0], n: input[1]))
    }
    
    result.forEach {
        print($0)
    }
}

func innerSolution(m: Int, n: Int) -> Int {
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 4), count: n + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 4), count: n + 4)
    
    var inputs: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    
    var result: Int = 0
    
    // graph 구현
    for i in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }.map { $0 == 1 }
        inputs[i] = input
    }
    
    for i in 0 ..< inputs.count {
        for j in 0 ..< inputs[i].count {
            graph[i + 1][j + 1] = inputs[i][j]
        }
    }
    
    // dfs 구현
    
    let directionRow = [1, -1, 0, 0, 1, -1, 1, -1]
    let directionColum = [0, 0, 1, -1, 1, -1, -1, 1]
    
    func dfs(_ x: Int, _ y: Int) {
        visited[y][x] = true
        
        for i in 0 ..< 8 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if graph[newY][newX] && !visited[newY][newX] {
                dfs(newX, newY)
            }
        }
    }
    
    // answer 구현
    
    for i in 0 ..< m + 1 {
        for j in 0 ..< n + 1 {
            if graph[j][i] && !visited[j][i] {
                dfs(i, j)
                result += 1
            }
        }
    }
    
    return result
}

solution()
