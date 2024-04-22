//
//  14470_전자레인지.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/22/24.
//

import Foundation

// 그리디는 "어떻게 정렬할지 아이디어"를 잘 떠올려서
// 현재의 해가 미래의 해의 영향을 주지 않는지를 체크(=총 최적의해)한 이후에 그리디 알고리즘을 적용한다.

// 14470_전자레인지

// A 5분 = 300초
// B 1분 = 60초
// C 10초

func solution() {
    var time = Int(readLine()!)!
    
    let operTimes = [300, 60, 10]
    var result: [Int] = [0, 0, 0]
    
    if time % 10 != 0 {
        print("-1")
        return
    }
    
//    while time - 300 >= 0 {
//        print("+1")
//        result[0] += 1
//        time -= 300
//    }
//
//    while time - 60 >= 0 {
//        result[1] += 1
//        time -= 60
//    }
//
//    while time >= 10 {
//        result[2] += 1
//        time -= 10
//    }
    
    operTimes.enumerated().forEach {
        if $0.element <= time {
            result[$0.offset] = time / $0.element
            time -= (time / $0.element) * $0.element
        }
    }

    result.forEach {
        print($0, terminator: " ")
    }
}

solution()
