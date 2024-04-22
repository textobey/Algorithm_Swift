//
//  4796_캠핑.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/22/24.
//

import Foundation

// 4796_캠핑

// 캠핑장을 연속하는일 P일 중, L일 동안만 사용 가능 V일짜리 휴가를 시작했다
// 최대 며칠 동안 사용할수있을까 1 < L < P < V

func solution() {
    // P    L                     V
    // 8일중 5일동안만 사용가능, 강산이는 20일짜리 휴가를 시작
    
    // 5일 사용 -> 3일 쉬고 -> 5일 사용 -> 3일 쉬고 -> 5일 사용 ->
    //        15        12.        7         4
    // 5일 + 5일 + 4
    
    var inputs: [[Int]] = []
    
    while true {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if input[0] == 0 && input[1] == 0 && input[2] == 0 {
            break
        }
        inputs.append(input)
    }
    
    var result: [Int] = Array(repeating: 0, count: inputs.count)
    
    for (index, input) in inputs.enumerated() {
        let l: Int = input[0]
        let p: Int = input[1]
        let remainRefresh = input[2]
        
        result[index] += (remainRefresh / p) * l
        
        // 반례로 [2, 8, 23]이 들어왔을때, 4일((remainRefresh / p) * l)을 간 뒤에
        // 휴가가 7일 남았는데, 2일을 사용하면 5일은 breakTime이라서 2일만 더 갈 수 있는 상태가 됨
        //remainRefresh -= (remainRefresh / p) * p
        result[index] += min(remainRefresh % p, l)
    }
    
    result.enumerated().forEach {
        print("Case \($0.offset + 1): \($0.element)")
    }
}

solution()
