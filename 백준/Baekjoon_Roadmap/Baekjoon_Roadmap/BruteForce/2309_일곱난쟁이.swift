//
//  2309_일곱난쟁이.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 5/7/24.
//

import Foundation

// 2309_일곱난쟁이

// 내가 놓친 아이디어.
// 나는 7명을 합해서 딱 100이 되는 경우의수를 찾으려고 했으나,
// 모든 키를 더한 값에서 100을 빼고,
// 배열에서 2개 값을 뽑는 모든 경우의 수를 체크하여
// 초과된 키와 같은 결과를 가지는 난쟁이 2명을 찾는게 훨씬 빠르다.

func solution() {
    var heights: [Int] = Array(repeating: 0, count: 9)

    for i in 0 ..< 9 {
        let height = Int(readLine()!)!
        heights[i] = height
    }
    
//    var heights: [Int] = [
//        20,
//        7,
//        23,
//        19,
//        10,
//        15,
//        25,
//        8,
//        13
//    ]
    
    let overHeight: Int = heights.reduce(0, +) - 100
    var fakers: Set<Int> = []
    
    loop: for i in 0 ..< heights.count {
        for j in (i + 1) ..< 9 {
            if (heights[i] + heights[j]) == overHeight {
                fakers.insert(heights[i])
                fakers.insert(heights[j])
                break loop
            }
        }
    }
    
    Set(heights).subtracting(fakers).sorted().forEach {
        print($0)
    }
}

solution()
