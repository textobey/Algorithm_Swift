//
//  2810_컵홀더.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/23/24.
//

import Foundation

// 2810_컵홀더

func solution() {
    
    _ = Int(readLine()!)!
    
    let input: String = readLine()!
    
    let coupleChairsCount: Int = input.replacingOccurrences(of: "LL", with: "L")
        .filter { $0 == "L" }.count
    
    if coupleChairsCount > 0 {
        // 커플좌석이 존재하는 경우 컵홀더의 개수 = 시트개수(input) - 커풀좌석(coupleChairsCount) 개수가됨
        // 그런데, 우측 좌석 끝에 컵홀더가 하나 더 있으니까 + 1
        print(input.count + 1 - coupleChairsCount)
    } else {
        print(input.count)
    }

}

solution()
