//
//  2839_설탕배달.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/23/24.
//

import Foundation

// 2839_설탕배달

func solution() {
    var sugarWeight: Int = Int(readLine()!)!
    
    //let basketSizes: [Int] = [5, 3]
    
    var result: Int = 0
    
    // 3과 5는 배수라서 둘중 뭐로해도 상관없지만, 최소 봉투를 구하는거라 큰수 5로 계산
    if sugarWeight % 5 == 0 {
        print(sugarWeight / 5)
        return
    }
    
    // 가장 적은 봉투를 가져가기 위해 11의 경우 3짜리 봉투 2개 + 5짜리 봉투 1개를 가져가야하는 케이스가 있음.
    //
    // 3짜리를 계속 빼면서 5로 나눈 나머지가 0이 되는 순간을 구하거나
    // 5짜리를 계속 빼면서 3으로 나눈 나머지가 0이 되는 순간을 구함
    while sugarWeight >= 0 {
        if sugarWeight - 3 < 0 {
            print("-1")
            return
        }
        sugarWeight -= 3
        result += 1
        
        if sugarWeight % 5 == 0 {
            result += (sugarWeight / 5)
            break
        }
    }
    
    print(result)
    
}

solution()
