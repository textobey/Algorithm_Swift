//
//  2720_세탁소사장동혁.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/23/24.
//

import Foundation

// 2720_세탁소사장동혁

func solution() {
    let testCaseCount: Int = Int(readLine()!)!
    
    var prices: [Int] = []
    
    for _ in 0 ..< testCaseCount {
        let input = Int(readLine()!)!
        prices.append(input)
    }
    
    let returnUnits: [Int] = [25, 10, 5, 1]
    
    var results: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: testCaseCount)
    
    for i in 0 ..< prices.count {
        returnUnits.enumerated().forEach {
            if prices[i] >= $0.element {
                results[i][$0.offset] = (prices[i] / $0.element)
                prices[i] -= (prices[i] / $0.element) * $0.element
            }
        }
    }
    
    for result in results {
        print(result.compactMap { String($0) }.joined(separator: " "))
    }
}

solution()
