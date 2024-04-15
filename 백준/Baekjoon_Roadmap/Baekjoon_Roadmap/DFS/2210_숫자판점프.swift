//
//  2210_숫자판점프.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/15/24.
//

import Foundation

// 2210 숫자판점프

func solution() {
    
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    //var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 9), count: 9)
        
    var result: Set<String> = []
    
    var inputs: [[Int]] = []
    
//    var inputs: [[Int]] = [
//        [1, 1, 1, 1, 1],
//        [1, 1, 1, 1, 1],
//        [1, 1, 1, 1, 1],
//        [1, 1, 1, 2, 1],
//        [1, 1, 1, 1, 1],
//    ]
    
    // graph 채우기
    for _ in 0 ..< 5 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        inputs.append(input)
    }
    
    for i in 0 ..< 5 {
        for j in 0 ..< 5 {
            graph[i + 1][j + 1] = inputs[i][j]
        }
    }
    
    // dfs
    
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    func dfs(x: Int, y: Int, string: String) {
        //visited[y][x] = true
        
        // Point. DFS 재귀의 탈출을 visited가 아닌 string.count로 판별하고, 모든 경우의 수 탐색하기
        if string.count == 6 {
            result.insert(string)
            return
        }
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if (newX >= 1 && newY >= 1) && (newX <= 5 && newY <= 5) {
                let newString = string + String(graph[newY][newX])
                dfs(x: newX, y: newY, string: newString)
            }
        }
    }
    
    // answer
    
    for i in 1 ... 5 {
        for j in 1 ... 5 {
            //visited = Array(repeating: Array(repeating: false, count: 9), count: 9)
            //if !visited[j][i] {
                dfs(x: i, y: j, string: String(graph[j][i]))
            //}
        }
    }
    
    //print(result)
    print(result.count)
}

solution()
