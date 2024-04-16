//
//  2644_촌수계산.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/16/24.
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
    
    func bfs(_ current: Int) {
        var queue: [(node: Int, depth: Int)] = [(current, 0)]
        visited[current] = true
        
        while !queue.isEmpty {
            // 반례. 찾고자하는 secondRelation이 firstIndex에 있어서, remove되고 contains false
            let element = queue.removeFirst()
            //print("지나간길", element)
            
            if element.node == secondRelation {
                answer = element.depth
                return
            }
            
            for nextNode in graph[element.node] {
                if !visited[nextNode] {
                    visited[nextNode] = true
                    queue.append((nextNode, element.depth + 1))
                }
            }
        }
    }
    
    // answer 구현
    
    // firstRelation부터 시작해서 secondRelation에 도달하는데까지 depth가 몇인지 파악
    bfs(firstRelation)
    
    print(answer)
    
}

solution()

