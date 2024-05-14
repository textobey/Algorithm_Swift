//
//  1145_적어도대부분의배수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/14.
//

import Foundation

// 1145_적어도 대부분의 배수
//
// 아이디어1.
// 문제의 지문이 조금 이해가 안갔지만, 천천히 이해해보자면
// 5개의 숫자가 주어질때, 숫자로 완전히 나누어지는(나머지가 0) x를 찾는데
// 5개의 숫자 중 최소 3개로 x를 완전히 나눌수있어야 한다. => 이게 "적어도 대부분의 배수"

func solution() {
    let nums: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var count: Int = 0
    
    while true {
        count += 1
        
        var result: Int = 0
        
        for num in nums {
            if count % num == 0 {
                result += 1
            }
        }
        
        if result >= 3 {
            print(count)
            return
        }
    }
}

solution()
