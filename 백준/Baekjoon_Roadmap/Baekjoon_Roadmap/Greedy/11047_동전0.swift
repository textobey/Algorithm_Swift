//
//  11047_동전0.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/24/24.
//

import Foundation

// 11047_동전0

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let unitCount: Int = input[0]
    var k = input[1]
    
    var units: [Int] = []
    
//    var units: [Int] = [
//        50000,
//        10000,
//        5000,
//        1000,
//        500,
//        100,
//        50,
//        10,
//        5,
//        1
//    ]
    
    for _ in 0 ..< unitCount {
        let unit = Int(readLine()!)!
        units.append(unit)
    }
    
    units.sort(by: >)
    
    var result: Int = 0
    
    units.enumerated().forEach {
        if $0.element <= k {
            let count = (k / $0.element)
            result += count
            k -= count * $0.element
        }
    }
    
    print(result)
}

solution()
