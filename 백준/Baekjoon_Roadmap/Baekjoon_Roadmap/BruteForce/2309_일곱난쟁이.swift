//
//  2309_일곱난쟁이.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 5/7/24.
//

import Foundation

// 2309_일곱난쟁이
// needFix.

func solution() {
    var heights: [Int] = Array(repeating: 0, count: 9)
    
    for i in 0 ..< 9 {
        let height = Int(readLine()!)!
        heights[i] = height
    }
    
    loop: for i in 0 ..< 9 {
        var temp: Int = 0
        var result: [Int] = []
        
        for j in 0 ..< 9 {
            if i != j {
                temp += heights[j]
                result.append(heights[j])
            }
            if temp == 100 && result.count == 7 {
                print(result)
                break loop
            }
        }
    }
    
    //print(heights)
}

solution()
