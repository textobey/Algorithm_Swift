//
//  5014_스타트링크.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/22/24.
//

import Foundation

// 5014_스타트링크

// F 마지막 층
// S 강호가 있는 층
// G 스타트링크가 있는 층
// U 위로가는 층
// D 아래로가는 층

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let f: Int = input[0]
    let s: Int = input[1]
    let g: Int = input[2]
    let u: Int = input[3]
    let d: Int = input[4]
    
    var visited: [Bool] = Array(repeating: false, count: f + 1)
    
    var result: String = "use the stairs"
    // graph 채우기
    
    // bfs 구현
    func bfs(_ current: Int) {
        var queue: [(floor: Int, depth: Int)] = [(current, 0)]
        visited[current] = true
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            
            if element.floor == g {
                result = String(element.depth)
                return
            }
            
            if isValid(element.floor + u), !visited[element.floor + u] {
                queue.append((element.floor + u, element.depth + 1))
                visited[element.floor + u] = true
            }
            
            if isValid(element.floor - d), !visited[element.floor - d] {
                queue.append((element.floor - d, element.depth + 1))
                visited[element.floor - d] = true
            }
        }
    }
    
    func isValid(_ floor: Int) -> Bool {
        return 1 ... f ~= floor
    }
    
    bfs(s)
    
    print(result)
}

solution()
