//
//  3460_이진수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    // 테스트 케이스 개수
    let t = Int(readLine()!)!
    
    var nums: [Int] = []
    
    (0 ..< t).forEach { _ in
        nums.append(Int(readLine()!)!)
    }
    
    for i in nums {
        String(i, radix: 2).map { String($0) }.reversed().enumerated().forEach {
            if $0.element == "1" {
                print($0.offset, terminator: " ")
            }
        }
    }

}

solution()
