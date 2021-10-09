//
//  다리놓기.swift
//
//
//  Created by 이서준 on 2021/10/08.
//

import Foundation

func solution() {
    var dp = [[Int]](repeating: [Int](repeating: 1, count: 30), count: 30)
    
    for i in 2 ..< 30 {
        for j in 1 ..< i {
            // 조합식
            // nCr = n-1 C r + n-1 C r-1
            dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
        }
    }
    
    //print(dp)
    
    let t = Int(readLine()!)!

    for _ in 0 ..< t {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        print(dp[input[1]][input[0]])
    }
}

solution()
