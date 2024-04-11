//
//  11725_트리의부모찾기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/11/24.
//

import Foundation

// 11725 트리의부모찾기
// Point. Graph 배열을 기반으로 노드 연결 그래프를 그릴줄 알아야하고, 노드 연결 그래프를 배열 기반으로 변경할줄도 알아야함

func solution() {
    let n: Int = Int(readLine()!)! //7
    
//    var input: [[Int]] = []
    
//    var input: [[Int]] = [
//        [1, 6],
//        [6, 3],
//        [3, 5],
//        [4, 1],
//        [2, 4],
//        [4, 7]
//    ]
    
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)
    
    var result: [Int] = Array(repeating: 0, count: n)
    
    // graph
    for _ in 0 ..< n - 1 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = input[1]
        let y = input[0]
        
        graph[x].append(y)
        graph[y].append(x)
    }
    
    // dfs
    func dfs(_ current: Int) {
        visited[current] = true
        
        for node in graph[current] {
            if !visited[node] {
                result[node - 1] = current
                dfs(node)
            }
        }
    }
    
    for i in 0 ..< n {
        dfs(i + 1)
    }
    
    result.dropFirst().forEach {
        print($0)
    }
}

solution()
