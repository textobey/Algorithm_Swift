//
//  7562_나이트의이동.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/19/24.
//

import Foundation

func solution() -> Int {
    
    let size: Int = Int(readLine()!)!
    
    let startReadLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let endReadLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let startPoint = Coordinate(x: startReadLine[0], y: startReadLine[1])
    let endPoint = Coordinate(x: endReadLine[0], y: endReadLine[1])
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
    
    let direction: [Coordinate] = [
        Coordinate(x: 2, y: -1),
        Coordinate(x: 2, y: 1),
        Coordinate(x: 1, y: -2),
        Coordinate(x: 1, y: 2),
        Coordinate(x: -2, y: -1),
        Coordinate(x: -2, y: 1),
        Coordinate(x: -1, y: -2),
        Coordinate(x: -1, y: 2)
    ]
    
    var answer: Int = 0
    
    // bfs 구현
    func bfs(_ coordinate: Coordinate) {
        var queue: [(coordinate: Coordinate, depth: Int)] = [(coordinate, 0)]
        visited[coordinate.y][coordinate.x] = true
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            
            if element.coordinate.x == endPoint.x && element.coordinate.y == endPoint.y {
                answer = element.depth
                return
            }
            
            for i in 0 ..< direction.count {
                let newCoordinate = Coordinate(
                    x: element.coordinate.x + direction[i].x,
                    y: element.coordinate.y + direction[i].y
                )
                
                if isVaild(newCoordinate, maxSize: size), !visited[newCoordinate.y][newCoordinate.x] {
                    queue.append((newCoordinate, element.depth + 1))
                    visited[newCoordinate.y][newCoordinate.x] = true
                }
            }
        }
    }
    
    // answer
    bfs(startPoint)
    
    return answer
}

func isVaild(_ coordinate: Coordinate, maxSize: Int) -> Bool {
    return 0 ..< maxSize ~= coordinate.x && 0 ..< maxSize ~= coordinate.y
}

let testCaseCount: Int = Int(readLine()!)!
var results: [Int] = []

for _ in 0 ..< testCaseCount {
    results.append(solution())
}

results.forEach {
    print($0)
}
