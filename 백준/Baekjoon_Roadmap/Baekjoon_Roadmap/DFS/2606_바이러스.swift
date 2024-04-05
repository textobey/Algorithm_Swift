//
//  2606_바이러스.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/4/24.
//

import Foundation

func solution() {
    let node: Int = Int(readLine()!)!
    let edge: Int = Int(readLine()!)!
    
    var graph: [[Int]] = Array(repeating: [], count: node + 1)
    var visited: [Bool] = Array(repeating: false, count: node + 1)
    
    // 1. graph 구현
    for _ in 0 ..< edge {
        let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = relation[0]
        let b = relation[1]
        
        graph[a].append(b)
        graph[b].append(a)
    }
    
    graph = graph.map { $0.sorted(by: <) }
    
    // 2. dfs 구현
    func dfs(_ current: Int) {
        visited[current] = true
        
        for i in graph[current] {
            if !visited[i] {
                dfs(i)
            }
        }
    }
    
    dfs(1)
    
    // 3. 결과값 구현
    print(visited.filter { $0 }.count - 1)
}

solution()
