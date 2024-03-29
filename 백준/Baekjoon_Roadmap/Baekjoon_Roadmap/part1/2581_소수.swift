//
//  2581_소수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    let sScope = Int(readLine()!)!
    let eScope = Int(readLine()!)!
    
    var primeNumbers: [Int] = []
    
    for i in sScope ... eScope  {
        var divieded: [Int] = []
        
        for j in 2 ... Int(sqrt(Double(i))) {
            if i % j == 0 {
                divieded.append(j)
            }
        }
        
        if divieded.isEmpty {
            primeNumbers.append(i)
        }
    }
    
    if primeNumbers.isEmpty {
        print("-1")
        return
    }
    
    primeNumbers.forEach {
        print($0)
    }
}

solution()

