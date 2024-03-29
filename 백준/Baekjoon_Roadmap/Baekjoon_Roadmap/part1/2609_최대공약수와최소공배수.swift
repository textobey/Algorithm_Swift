//
//  2609_최대공약수와최소공배수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let a = input[0]
    let b = input[1]
    
    print(gcd(a, b))
    print(lcm(a, b))
}

func gcd(_ a: Int, _ b: Int) -> Int {
    // a % b .. 몫(Q), 나머지(R)
    // R이 0이 될때, Q가 최대공약수가 된다
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

solution()
