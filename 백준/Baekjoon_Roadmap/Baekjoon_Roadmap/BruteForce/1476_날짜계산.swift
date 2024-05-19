//
//  1476_날짜계산.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/19.
//

import Foundation

// 1476_날짜계산

func solution() {
    //let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var E: Int = 15
    var S: Int = 28
    var M: Int = 19
    
    var earth: Int = 1
    var sun: Int = 1
    var moon: Int = 1
    
    var currentYear: Int = 1
    
    while true {
        if earth == E && sun == S && moon == M {
            //currentYear += 1
            print(currentYear)
            return
        }
        
        earth += 1
        sun += 1
        moon += 1
        
        currentYear += 1
        
        if earth > 15 {
            earth = 1
        }
        
        if moon > 19 {
            moon = 1
        }
        
        if sun > 28 {
            sun = 1
        }
    }
}

solution()
