//
//  2460_지능형기차2.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    var result: Int = 0
    var current: Int = 0
    
    // 역 10개
    for _ in 0 ..< 10 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        // 내린사람
        current -= input[0]
        // 탄사람
        current += input[1]
        result = max(result, current)
    }
    
    print(result)
}

solution()
