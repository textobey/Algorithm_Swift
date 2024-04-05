//
//  DFS와BFS.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/3/24.
//

import Foundation

func dfs와bfs() {
    let node: Int = 4
    let edge: Int = 5
    
    var graph: [[Int]] = Array(repeating: [], count: node + 1)
    var visited = [Bool](repeating: false, count: node + 1)
    
    var dfsResult: [Int] = []
    var bfsResult: [Int] = []
    
    // 1. graph 채우기
    for _ in 0 ..< edge {
        let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = relation[0]
        let b = relation[1]
        
        graph[a].append(b)
        graph[b].append(a)
    }
    
    graph = graph.map { $0.sorted(by: <) }
    
    // 2. dfs 구성하기
    func dfs(_ current: Int) {
        if !visited[current] {
            dfsResult.append(current)
            visited[current] = true
        }
        
        for i in graph[current] {
            if !visited[i] {
                dfs(i)
            }
        }
    }
    
    // 2-1 bfs 구성하기
    func bfs(_ current: Int) {
        var queue: [Int] = [current]
        visited[current] = true
        
        while !queue.isEmpty {
            let route = queue.removeFirst()
            bfsResult.append(route)
            
            for i in graph[current] {
                if !visited[i] {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
    }
    
    dfs(1)
    visited = Array(repeating: false, count: node + 1)
    bfs(1)
    
    // 3. result 구하기
    print(dfsResult.map { String($0) }.joined(separator: " "))
    print(bfsResult.map { String($0) }.joined(separator: " "))
    
}

dfs와bfs()
