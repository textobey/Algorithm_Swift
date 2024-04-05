//
//  2667_단지번호붙이기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/5/24.
//

import Foundation

func solution() {
    let m: Int = Int(readLine()!)!
    
    var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 4), count: m + 4)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 4), count: m + 4)
    
    var complexCount: Int = 0
    var houseCountsInComplex: [[Int]] = []
    
    //let input: [[Int]] = [
    //    [0, 1, 1, 0, 1, 0, 0],
    //    [0, 1, 1, 0, 1, 0, 1],
    //    [1, 1, 1, 0, 1, 0, 1],
    //    [0, 0, 0, 0, 1, 1, 1],
    //    [0, 1, 0, 0, 0, 0, 0],
    //    [0, 1, 1, 1, 1, 1, 0],
    //    [0, 1, 1, 1, 0, 0, 0]
    //]
    var input: [[Int]] = []
    
    // 입력
    for _ in 0 ..< m {
        input.append(readLine()!.map { Int(String($0))! })
    }
    
    // graph 구현
    for i in 0 ..< m {
        for j in 0 ..< m {
            graph[i + 1][j + 1] = input[i][j] == 1
        }
    }
    
    // dfs 구현
    let directionRow = [1, -1, 0, 0]
    let directionColum = [0, 0, 1, -1]
    
    func dfs(x: Int, y: Int) {
        visited[y][x] = true
        let lastIndex = houseCountsInComplex.endIndex - 1
        houseCountsInComplex[lastIndex] = [houseCountsInComplex[lastIndex].reduce(0, +) + 1]
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if graph[newY][newX] && !visited[newY][newX] {
                dfs(x: newX, y: newY)
            }
        }
    }
    
    for i in 0 ..< graph.count {
        for j in 0 ..< graph[i].count {
            if graph[j][i] && !visited[j][i] {
                houseCountsInComplex.append([0])
                dfs(x: i, y: j)
                complexCount += 1
            }
        }
    }
    
    // answer 구현
    print(complexCount)
    if houseCountsInComplex.count <= 0 {
        print(0)
    } else {
        houseCountsInComplex.sort(by: {$0[0] < $1[0] })
        for complex in houseCountsInComplex {
            print(complex.first ?? 0)
        }
    }
}

solution()
