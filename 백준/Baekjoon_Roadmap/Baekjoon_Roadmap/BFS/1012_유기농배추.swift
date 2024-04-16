//
//  1012_유기농배추.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/16/24.
//

import Foundation

func solution() -> Int {
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let width: Int = input[0]
    let height: Int = input[1]
    let edge: Int = input[2]

    var graph = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
    var visited = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
    
    var result: Int = 0
    
//    var relations: [[Int]] = [
//        [0, 2],
//        [1, 2],
//        [2, 2],
//        [3, 2],
//        [4, 2],
//        [4, 0]
//    ]
    
    // 1. graph 채우기
    for _ in 0 ..< edge {
        let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = relation[0] //relations[i][0]
        let y = relation[1] //relations[i][1]
        // 이중배열에서는 [열(y)][행(x)]이기에 graph[y][x]로 접근 + (0,0)부터 배치되지 않도록 + 1
        graph[y + 1][x + 1] = true
    }
    
    let directionRow = [1, -1, 0, 0] // 행에서 좌 우
    let directionColum = [0, 0, 1, -1] // 열에서 상 하
    
    func bfs(x: Int, y: Int) {
        var queue: [Coordinate] = [Coordinate(x: x, y: y)]
        visited[y][x] = true
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            
            for i in 0 ..< 4 {
                let newX = element.x + directionRow[i]
                let newY = element.y + directionColum[i]
                
                if graph[newY][newX] && !visited[newY][newX] {
                    visited[newY][newX] = true
                    queue.append(Coordinate(x: newX, y: newY))
                }
            }
        }
    }
    
    for i in 1 ... width {
        for j in 1 ... height {
            if graph[j][i] && !visited[j][i] {
                result += 1
                bfs(x: i, y: j)
            }
        }
    }
    
    // 3. 답변만들기
    //print(result)
    return result
}

let testCaseCount: Int = Int(readLine()!)!

var bugCounts: [Int] = []

for _ in 0 ..< testCaseCount {
    bugCounts.append(solution())
}

for bugCount in bugCounts {
    print(bugCount)
}

