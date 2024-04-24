//
//  1541_잃어버린괄호.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/24/24.
//

import Foundation

// 1541 잃어버린 괄호

func solution() {
    let oper: String = readLine()!
    
    let depth1 = oper.split(separator: "-").map { String($0) }
    
    let depth2 = depth1.map { $0.split(separator: "+").map { Int($0)! }.reduce(0, +) }
    
    let result = depth2.dropFirst().reduce(depth2.first ?? 0) { (total, number) in
        return total - number
    }
    
    print(result)
}

solution()
