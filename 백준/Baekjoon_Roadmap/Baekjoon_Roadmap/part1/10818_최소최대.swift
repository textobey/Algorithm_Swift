//
//  10818_최소최대.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    // 정수의 개수
    let t = Int(readLine()!)!
    let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    
    print(nums.min()!, nums.max()!, terminator: " ")
}

solution()
