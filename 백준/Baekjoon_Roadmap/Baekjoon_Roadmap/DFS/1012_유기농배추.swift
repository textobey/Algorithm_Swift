//
//  1012_유기농배추.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/5/24.
//

import Foundation

func solution() {
    let m: Int = 5
    let n: Int = 3
    let edge: Int = 6
    
    // 문제가 0,0부터 쓰기 시작하기 때문에, 이렇게하면 나중에 range를 벗어나 for문에서 크래쉬 발생하는 것을 고려하지 않아도 됨
    // 원래도 (0, 0)를 안쓰는 문제에서도 (1,1)시작하기 위해 +1을 해줬으니, 여기선 +1을 더해주어야함 (총 +2) + (ps. 상하좌우 검색시 넉넉하게 2를 더해주라는데?)
    var graph = Array(repeating: Array(repeating: false, count: m + 4), count: n + 4)
    var visited = Array(repeating: Array(repeating: false, count: m + 4), count: n + 4)
    
    var result: Int = 0
    
    // 1. graph 채우기
    for _ in 0 ..< edge {
        let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = relation[0]
        let y = relation[1]
        // 이중배열에서는 [열(y)][행(x)]이기에 graph[y][x]로 접근 + (0,0)부터 배치되지 않도록 + 1
        graph[y + 1][x + 1] = true
    }
    
    let directionRow = [1, -1, 0, 0] // 행에서 좌 우
    let directionColum = [0, 0, 1, -1] // 열에서 상 하
    
    // 2. dfs
    // check: x와 y를 헷갈리지말자, (ex. (x3, y2) 위치를 확인하고싶다면 array[2(y)][3(x)] 이다.)
    func dfs(x: Int, y: Int) {
        visited[y][x] = true
        
        for i in 0 ..< 4 {
            let newX = x + directionRow[i]
            let newY = y + directionColum[i]
            
            if graph[newY][newX] && !visited[newY][newX] {
                dfs(x: newX, y: newY)
            }
        }
    }
    
    for i in 0 ..< m + 1 {
        for j in 0 ..< n + 1 {
            if graph[j][i] && !visited[j][i] {
                dfs(x: i, y: j)
                result += 1
                print("y", j, "x", i)
            }
        }
    }
    
    // 3. 답변만들기
    print(result)
}

solution()
