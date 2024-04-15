//
//  1743_음식물피하기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/15.
//

import Foundation

// 1743 음식물 피하기

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let height: Int = input[0]
    let width: Int = input[1]
    let edge: Int = input[2]
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
    
    var result: [Int] = []
    
//    let inputs: [[Int]] = [
//        [3, 2],
//        [2, 2],
//        [3, 1],
//        [2, 3],
//        [1, 1]
//    ]
    
    // graph 채우기
    for _ in 0 ..< edge {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = input[1]
        let y = input[0]
        
        graph[y][x] = true
    }
    
    // dfs 구현
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    func dfs(x: Int, y: Int) {
        visited[y][x] = true
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if graph[newY][newX] && !visited[newY][newX] {
                result[result.endIndex - 1] += 1
                dfs(x: newX, y: newY)
            }
        }
    }
    // (2, 3) (3, 1), (3, 2)
    //. . . . .
    //. # . . .
    //. . # # .
    //. # # . .
    
    // answer 구현
    
    for i in 1 ... width {
        for j in 1 ... height {
            if graph[j][i] && !visited[j][i] {
                result.append(1)
                dfs(x: i, y: j)
            }
        }
    }
    
    print(result.max()!)
}

solution()
