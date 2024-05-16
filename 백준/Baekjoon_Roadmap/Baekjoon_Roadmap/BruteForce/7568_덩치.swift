//
//  7568_덩치.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/16.
//

import Foundation

// 7568_덩치
//
// 아이디어1.
// 배열을 순회하면서 1:1로 비교하기 위해 2개씩 뽑는
// 모든 경우의수를 통해 해답을 구하려고 했으나,
// 이렇게 될 경우 맨 뒤에 입력된 값은 항상 1위가 나오는 문제가 있어서
// 배열을 순회하면서 filter 함수로 "배열 전체"에서
// 나보다 덩치가 큰 사람의 수를 구하는 방식으로 변경.
// rank를 1로 시작하는 이유는? 나보다 덩치큰사람수 + 1이 나의 순위이기 때문에

func solution() {
    
    let testCase = Int(readLine()!)!
    
    var frames: [(weight: Int, height: Int, rank: Int)] = []
//        (55, 185, 1),
//        (58, 183, 1),
//        (88, 186, 1),
//        (60, 175, 1),
//        (46, 155, 1)
//    ]
    
    for _ in 0 ..< testCase {
        let frame = readLine()!.split(separator: " ").map { Int(String($0))! }
        frames.append((frame[0], frame[1], 1))
    }
    
    frames.enumerated().forEach { (offset, frame) in
        let biggers = frames.filter {
            frame.weight < $0.weight && frame.height < $0.height
        }.count

        frames[offset].rank += biggers
        print(frames[offset].rank, terminator: " ")
    }
}

solution()
