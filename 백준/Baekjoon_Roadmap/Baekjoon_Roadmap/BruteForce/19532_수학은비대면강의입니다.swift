//
//  19532_수학은비대면강의입니다.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/10.
//

import Foundation

// 19532_수학은비대면강의입니다

// 아이디어1.
// 연립방정식의 대입법을 사용하려 풀어보려고 했다.
// 예제(1, 3, -1, 4, 1, 7)이 주어졌을때 대입법을 통해
//
// x = -3y-1
// 4 * (-3y-1) + 1y = 7 ... y가 -1이라는 것을 구하고,
// 1x + (3 * -1) = -1 ... x가 2라는 것을 구할수있다.
//
// 하지만, 브루트포스의 성징을 살려서
// -999 ... 999까지의 모든 경우의수를 체크하는것으로 수정

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let a = input[0]
    let b = input[1]
    let c = input[2]
    let d = input[3]
    let e = input[4]
    let f = input[5]
    
    for i in -999 ... 999 {
        for j in -999 ... 999 {
            if (a * i) + (b * j) == c {
                if (d * i) + (e * j) == f {
                    print(i, j)
                    return
                }
            }
        }
    }
}

solution()
