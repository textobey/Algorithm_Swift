//
//  2644_촌수계산.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/13.
//

import Foundation

// 2644 촌수계산

func solution() {
    let node: Int = Int(readLine()!)!
    
    let relations: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let firstRelation = relations[0]
    let secondRelation = relations[1]
    
    let m: Int = Int(readLine()!)! //edges count
    
    var edges: [[Int]] = []
    
    for _ in 0 ..< m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = input[0]
        let b = input[1]
        
        edges.append([a, b])
    }
    
    var graph: [[Int]] = Array(repeating: [], count: node + 1)
    var visited: [Bool] = Array(repeating: false, count: node + 1)
    
    var answer: Int = -1
    
    // graph 채우기
    for i in 0 ..< m {
        let x = edges[i][0]
        let y = edges[i][1]
        
        graph[x].append(y)
        graph[y].append(x)
    }
    
    // dfs 구현
    func dfs(_ current: Int, depth: Int) {
        visited[current] = true
        
        if current == secondRelation {
            answer = depth
            return
        }
        
        for nextNode in graph[current] {
            if !visited[nextNode] {
                dfs(nextNode, depth: depth + 1)
            }
        }
    }
    
    // answer 구현
    
    // firstRelation부터 시작해서 secondRelation에 도달하는데까지 depth가 몇인지 파악
    dfs(firstRelation, depth: 0)
    
    print(answer)
    
}

solution()
