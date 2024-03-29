//
//  2051_약수구하기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let n = input[0]
    let k = input[1]
    
    var measure: [Int] = []
    
    for i in 1 ... n {
        if n % i == 0 {
            measure.append(i)
        }
    }
    
    if measure.count < k {
        print(0)
    } else {
        print(measure[k - 1])
    }
}

solution()

