//
//  1303_전쟁전투.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/16/24.
//

import Foundation

// 1303 전쟁-전투

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let width: Int = input[0] // 5
    let height: Int = input[1] // 5
    
    var originWarriors: [[String]] = []
    
    //        var warriors: [[String]] = [
    //            ["W", "B", "W", "W", "W"],
    //            ["W", "W", "W", "W", "W"],
    //            ["B", "B", "B", "B", "B"],
    //            ["B", "B", "B", "W", "W"],
    //            ["W", "W", "W", "W", "W"],
    //        ]
    
    for _ in 0 ..< height {
        let warrior = readLine()!.map { String($0) }
        originWarriors.append(warrior)
    }
    
    calWarriorsPower(originWarriors, of: "W", width: width, height: height)
    calWarriorsPower(originWarriors, of: "B", width: width, height: height)
    
    // answer
    func calWarriorsPower(_ warriors: [[String]], of team: String, width: Int, height: Int) {
        
        var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width + 4), count: height + 4)
        
        // graph 채우기
        for i in 0 ..< warriors.count {
            for j in 0 ..< warriors[i].count {
                graph[i + 1][j + 1] = warriors[i][j] == team
            }
        }
        
        var warriorPowers: [Int] = []
        
        // dfs
        let directionRow = [1, -1, 0, 0]
        let directionColum = [0, 0, 1, -1]
        
        func dfs(x: Int, y: Int) {
            visited[y][x] = true
            
            for i in 0 ..< 4 {
                let newX = x + directionRow[i]
                let newY = y + directionColum[i]
                
                if graph[newY][newX] && !visited[newY][newX] {
                    warriorPowers[warriorPowers.endIndex - 1] += 1
                    dfs(x: newX, y: newY)
                }
            }
        }
        
        for i in 1 ... width {
            for j in 1 ... height {
                if graph[j][i] && !visited[j][i] {
                    warriorPowers.append(1)
                    dfs(x: i, y: j)
                }
            }
        }
        
        print(Int(warriorPowers.map { pow(Float($0), 2) }.reduce(0, +)), terminator: " ")
    }
}

solution()
