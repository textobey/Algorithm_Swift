//
//  1325_효율적인해킹.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/14.
//

import Foundation

// 1325 효율적인해킹
// warning: 시간복잡도(시간초과) unsolved

func solution() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

    let n: Int = input[0]
    let m: Int = input[1]

    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)

//    let relation: [[Int]] = [
//        [3, 1],
//        [3, 2],
//        [4, 3],
//        [5, 3]
//    ]

    for _ in 0 ..< m {
        let relation: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = relation[0]
        let b = relation[1]

        graph[a].append(b)
    }

    var result: [Int] = Array(repeating: 0, count: n + 1)

    // dfs 구현
    // Point Graph를 도식화 했을때 연결된 노드가 가장 많을때?,,
    // 촌수계산은 depth를 구하는거였다면, 현재 문제는 가장 많이 연결된 노드를 찾는것
    func dfs(_ current: Int) {
        visited[current] = true

        for node in graph[current] {
            if !visited[node] {
                result[node] += 1
                dfs(node)
            }
        }
    }

    for i in 1 ... n {
        visited = Array(repeating: false, count: n + 1)
        dfs(i)
    }

    result.enumerated().forEach {
        if $0.element == result.max()! {
            print($0.offset, terminator: " ")
        }
    }
}

solution()
