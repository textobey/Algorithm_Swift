//
//  5555_반지.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/20.
//

import Foundation

// 5555_반지
//
// 아이디어1.
// 반지에 각인된 문장에 내가 찾고자 하는 문장이 포함되어 있는지 찾는 문제인데,
// 반지에 특성상 문장이 쭉 연결되어 있기에, 어디든 시작점이 될수있다.
// 입력된 문장을 2번 연결하면 시작이 어디든 문장이 포함 되어있는지 찾을수있다.
// 아이디어를 잘 떠올려서 쉽게 푼것같다..

func solution() {
    let myRing: String = readLine()!
    
    let testCase: Int = Int(readLine()!)!

    var rings: [String] = []
    
    for _ in 0 ..< testCase {
        let ring = readLine()!
        rings.append(ring + ring)
    }
    
    let result = rings.filter { $0.contains(myRing) }.count
    
    print(result)
}

solution()
