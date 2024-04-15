//
//  2583_영역구하기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/15/24.
//

import Foundation

// 2583 영역구하기

func solution() {
    
    let specs: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let m: Int = specs[0] //5 // height
    let n: Int = specs[1] //7 // width
    let k: Int = specs[2] //3
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 4), count: m + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 4), count: m + 4)
    
    // graph 채우기
    for _ in 0 ..< k {
        let points = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        let minX = points[0] + 1
        let minY = points[1] + 1
        let maxX = points[2]
        let maxY = points[3]
        
        for x in minX ... maxX {
            for y in minY ... maxY {
                graph[y][x] = true
                visited[y][x] = true
            }
        }
    }
    
    //print(graph)
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    var sizes: [Int] = []
     
    // dfs 구현
    func dfs(x: Int, y: Int) {
        visited[y][x] = true
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            guard (newX <= n && newX > 0) && (newY <= m && newY > 0) else {
                continue
            }
            
            if !visited[newY][newX] {
                sizes[sizes.endIndex - 1] += 1
                dfs(x: newX, y: newY)
            }
        }
    }
    
    // answer 구현
    for i in 1 ... n {
        for j in 1 ... m {
            if !visited[j][i] {
                sizes.append(1)
                dfs(x: i, y: j)
            }
        }
    }
    
    print(sizes.count)
    print(sizes.sorted().map { String($0) }.joined(separator: " "))
}

solution()
