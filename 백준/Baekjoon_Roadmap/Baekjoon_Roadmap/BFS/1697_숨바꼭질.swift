//
//  1697_숨바꼭질.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/18.
//

import Foundation

// 1697 숨바꼭질

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n: Int = input[0]
    let m: Int = input[1]
    
    //var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: 10_001), count: 10_001)
    var visited: [Bool] = Array(repeating: false, count: 100001)
    
    // graph 채우기
    
    // bfs 구현
    func bfs(_ current: Int) {
        var queue: [(node: Int, depth: Int)] = [(current, 0)]
        visited[current] = true
        
        let direction = [-1, 1, 2]
        
        while !queue.isEmpty {
            
            let element = queue.removeFirst()
            
            if element.node == m {
                print(element.depth)
                return
            }
            
            for i in 0 ..< 3 {

                var nextNode: Int
                
                if direction[i] == 2 {
                    nextNode = element.node * 2
                } else {
                    nextNode = element.node + direction[i]
                }
                
                // Point 원래는 시간초과가 났었는데, visited 배열을 통해 이전에 방문한 노드라면? 가지뻗기X
                // 왜 why? 방문했던 배열이라면 이미 direction 작업을 했었는데 m 노드를 못찾았단 의미기 때문에 의미없음
                guard isVaild(nextNode), !visited[nextNode] else { continue }
                
                visited[nextNode] = true
                queue.append((nextNode, element.depth + 1))
            }
        }
    }
    
    bfs(n)
    
    // result 구현
}

func isVaild(_ node: Int) -> Bool {
    0 ..< 100001 ~= node
}

solution()
