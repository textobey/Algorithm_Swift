//
//  2178_미로탐색.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/21.
//

import Foundation

// 2178 미로 탐색

func solution() {
    let size = readLine()!.split(separator: " ").map { Int(String($0))! }
    
//    let endPoint = Coordinate(x: 6, y: 4)
    let endPoint = Coordinate(x: size[1], y: size[0])
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: endPoint.x + 4), count: endPoint.y + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: endPoint.x + 4), count: endPoint.y + 4)
    
    var miros: [[Bool]] = []
    
//    var miros: [[Bool]] = [
//        [true, false, true, true, true, true],
//        [true, false, true, false, true, false],
//        [true, false, true, false, true, true],
//        [true, true, true, false, true, true]
//    ]
    
//    var miros: [[Bool]] = [
//        [true, true, false, true, true, false],
//        [true, true, false, true, true, false],
//        [true, true, true, true, true, true],
//        [true, true, true, true, false, true]
//    ]
    
    for _ in 0 ..< endPoint.y {
        let miro = readLine()!.map { Int(String($0))! }.map { $0 == 1 }
        miros.append(miro)
    }
    
    for i in 0 ..< miros.count {
        for j in 0 ..< miros[i].count {
            graph[i + 1][j + 1] = miros[i][j]
        }
    }
    
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    // bfs 구현
    func bfs(_ coordinate: Coordinate) {
        var queue: [(coordinate: Coordinate, depth: Int)] = [(coordinate, 1)]
        visited[coordinate.y][coordinate.x] = true
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            
            if element.coordinate.x == endPoint.x && element.coordinate.y == endPoint.y {
                print(element.depth)
                return
            }
            
            for i in 0 ..< 4 {
                let newX = element.coordinate.x + directionRow[i]
                let newY = element.coordinate.y + directionColum[i]
                
                if graph[newY][newX] && !visited[newY][newX] {
                    queue.append((Coordinate(x: newX, y: newY), element.depth + 1))
                    visited[newY][newX] = true
                }
            }
        }
    }
    
    bfs(Coordinate(x: 1, y: 1))
}

solution()
