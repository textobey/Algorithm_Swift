//
//  11724_연결요소의개수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/8/24.
//

import Foundation

// 연결된 요소 = (그래프의)트리의 개수가 몇개인가?
func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let node = input[0]
    let edge = input[1]
    
    var graph: [[Int]] = Array(repeating: [], count: node + 1)
    var visited: [Bool] = Array(repeating: false, count: node + 1)
    
    var result: Int = 0
    
    // graph
    for _ in 0 ..< edge {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    // dfs 구현
    func dfs(_ current: Int) {
        visited[current] = true
        
        // Point. 노드에 방문했는지만 체크하고, 방문하지 않은 노드면 방문
        for nextNode in graph[current] {
            if !visited[nextNode] {
                dfs(nextNode)
            }
        }
    }
    
    // 노드가 1부터 존재하기 때문에, 1부터 탐색
    for n in 1 ... node {
        if !visited[n] {
            // 서로 연결된 노드들의 개수 체크
            result += 1
            dfs(n)
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
