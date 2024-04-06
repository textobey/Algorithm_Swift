//
//  main.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

// 연결된 요소 = (그래프의)트리의 개수가 몇개인가?
func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let node = input[0]
    let edge = input[1]
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: node + 1), count: node + 1)
    var visited: [Bool] = Array(repeating: false, count: node + 1)
    
    var result: Int = 0
    
    // graph
    for _ in 0 ..< edge {
        let input = readLine()!.split(separator: " ").map { Int(String($0)) }
        let x = input[0]!
        let y = input[1]!
        
        graph[x][y] = true
    }
    
    // dfs 구현
    func dfs(_ current: Int) {
        visited[current] = true
        
        for i in 1 ..< graph.count {
            if graph[current][i] && !visited[i] {
                dfs(i)
            }
        }
    }
    
    for i in 1 ..< graph.count {
        if !visited[i] {
            result += 1
            dfs(i)
        }
    }
    
    // answer 구현
    print(result)
}

solution()

//func solution() {
//
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//    let node = input[0]
//    let edge = input[1]
//
//    var graph: [[Int]] = Array(repeating: [], count: node + 1)
//    var visited = Array(repeating: false, count: node + 1)
//
//    // graph
//    for _ in 0 ..< edge {
//        let input = readLine()!.split(separator: " ").map { Int(String($0)) }
//        let y = input[0]!
//        let x = input[1]!
//
//        graph[x].append(y)
//        graph[y].append(x)
//    }
//
//    // dfs 구현
//    func dfs(_ current: Int) {
//        visited[current] = true
//
//        for i in graph[current] {
//            if !visited[i] {
//                dfs(i)
//            }
//        }
//    }
//
//    // answer 구현
//    dfs(1)
//
//    print(visited.split(separator: false).count)
//}
