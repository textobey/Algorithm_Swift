//
//  1978_소수찾기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    let testCaseCount = Int(readLine()!)!
    
    let nums = readLine()!.split(separator: " ").map { Int($0)! }

    var primeNumbers: [Int] = []
  
    for i in 0 ..< nums.count {
        var divided: [Int] = []
        
        for j in 1  ... nums[i] {
            if nums[i] % j == 0 {
                divided.append(j)
            }
        }
        
        if divided.count == 2 {
            primeNumbers.append(nums[i])
        }
    }
    
    print(primeNumbers.count)
}

solution()
