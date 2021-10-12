//
//  다리놓기.swift
//
//
//  Created by 이서준 on 2021/10/08.
//

import Foundation

func solution() {
    var dp = [[Int]](repeating: [Int](repeating: 1, count: 30), count: 30)
    
    /*
     n개의 점과 m개의 점으로 다리를 놓을수 있는 최대치는..?
     dp[n][m] = n점과 m점으로 놓을수있는 최대치
     
     n이 1인 경우
     dp[1][1] = 1
     dp[1][2] = 2
     dp[1][x] = x
     
     n이 1보다 큰경우..예를 들어 n=2, m=3이라고 하면
     n에서 가장 위에 위치하는 점이 m에서 가장 위에 위치하는 점과 연결되면? 남은점에서 갈수있는 최대치는 dp[1][2]가 된다.
     n에서 가장 위에 위치하는 점이 m에서 2번째로 위에 위치하는 점과 연결되면? 남은점에서 갈수있는 최대치는 dp[1][1]이 된다.
    */
    
    for i in 2 ..< 30 {
        for j in 1 ..< i {
        //ex dp[2][3] = dp[1][1](1개) + dp[1][2](2개)
            dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
        }
    }
    
    let t = Int(readLine()!)!

    for _ in 0 ..< t {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        print(dp[input[1]][input[0]])
    }
}

solution()
