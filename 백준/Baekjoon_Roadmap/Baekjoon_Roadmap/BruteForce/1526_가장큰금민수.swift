//
//  1526_가장큰금민수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/13.
//

import Foundation

// 1526_가장큰금민수
//
// 아이디어1.
// 예제를 보면 4와 7중이 모두 포함되어야 하는것이 아니라 하나만 있어도 된다는 것을 알수있음
// (n 부터 4까지) 역방향으로 반복문을 실행하면
// 첫번째 금민수가 결국 n보다는 작거나 같으면서 가장 큰 금민수가 된다.

func solution() {
    let n = Int(readLine()!)!
    
    for i in (4 ... n).reversed() {
        if String(i).map({ String($0) }).allSatisfy({ $0 == "4" || $0 == "7" }) {
            print(i)
            return
        }
    }
}

solution()
