//
//  2789_블랙잭.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/10.
//

import Foundation

// 2798_블랙잭

// 아이디어
// 주어진 카드들에서 3장이라는 정해진수만큼의 카드를 뽑아야한다.
// 주어진 카드 목록에서 3개씩 뽑을수있는 모든 경우의 수를 체크하면 된다는 의미가 된다.
// 주어진 카드의 정수들의 합이 m을 넘지 않는다면
// m에 최대한 근접해야하기 때문에, max(result, sum)으로 result를 바꿔나간다.

func solution() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n: Int = input[0]
    let m: Int = input[1]
    
    let cards: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var result: Int = 0
    
    for i in 0 ..< n - 2 {
        for j in (i + 1) ..< n - 1 {
            for k in (j + 1) ..< n {
                let sum = cards[i] + cards[j] + cards[k]
                
                if sum <= m {
                    result = max(result, sum)
                }
            }
        }
    }
    
    print(result)
}

solution()
