//
//  1476_날짜계산.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/19.
//

import Foundation

// 1476_날짜계산
//
// 아이디어1.
// 뭐랄까..전형적인 브루트포스 스탠다드 문제인거 같다.
// while 루프를 계속 돌다보면 E, S, M의 범위는 각자 다르지만
// 입력된 E, S, M과 일치하는 순간이 있도록 보장되는 문제
// 1년이 지날때마다 카운트 해주면서 그 순간이 언제인지 출력하면됨
// 단, 1년부터 시작하기에 1, 1, 1로 초기값 설정

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let E: Int = input[0]
    let S: Int = input[1]
    let M: Int = input[2]
    
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
