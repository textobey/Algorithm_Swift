//
//  main.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

//14888
func solution() {
    let testCaseCount = Int(readLine()!)!
    var nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    var operators: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    
    var resultMax = Int.min
    var resultMin = Int.max
    
    func dfs(count: Int, value: Int) {
        if count == testCaseCount {
            resultMax = max(value, resultMax)
            resultMin = min(value, resultMin)
            return
        }
        
        // 6
        // 1 2 3 4 5 6
        // 2 1 1 1
        
        // 0(+), 1(-), 2(*), 3(/)까지의 모든 경우를 봄
        //  -> 1 (+ - * /) 2 (+ - * /) 3 (+ - * /) 4 (+ - * /) 5 (+ - * /) 6
        // 너무 어렵다. 입력된 순서를 못바꾸는데 이 정도면
        // 우선 DFS, BFS, 그리디, 완전탐색에 대한 개념을 먼저 탑재해야할듯
        for i in 0 ..< 4 {
            if operators[i] != 0 {
                operators[i] -= 1
                var value = value
                if i == 0 {
                    value += nums[count]
                } else if i == 1 {
                    value -= nums[count]
                } else if i == 2 {
                    value *= nums[count]
                } else if i == 3 {
                    value /= nums[count]
                }
                dfs(count: count + 1, value: value)
                operators[i] += 1
            }
        }
    }
    
    dfs(count: 1, value: nums[0])
    print(resultMax)
    print(resultMin)
}

solution()

