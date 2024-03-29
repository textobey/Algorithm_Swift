//
//  1292_쉽게푸는문제.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    let scope = readLine()!.split(separator: " ").map { Int($0)! }
    
    var nums: [Int] = []
    
    loop: for i in 1 ..< scope[1] {
        for _ in 0 ..< i {
            nums.append(i)
            if nums.count >= scope[1] {
                break loop
            }
        }
    }
    
    print(nums[(scope[0] - 1)...].reduce(0, +))
}

solution()
