//
//  2231_분해합.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/09.
//

import Foundation

// 2231_분해합

// 첫번째 아이디어.
// 216을 만드려면, 1의 자리가 어쨌든 6이 되어야함
// 1의 자리를 6으로 만들 수 있는 3개의 숫자 조합을 찾음
// ex. (1 1 4) (1 2 3) (1 6 9) ....
// 이것을 생성자로 216을 만들수 있는지 체크.
// 잘 되긴 하지만 자릿수가 늘어날때마다 i++하여 체크하는 것보다
// 오히려 비효율적인 아이디어로 변해서 수정

func solution() {
    
    let n: Int = Int(readLine()!)!
    
    // n은 1도 가능하지만, 생성자가 있을수 없는 수
    // 1000000 다 돌아서 판단하기엔 비효율적이라 따로 처리
    if n == 1 {
        print(0)
        return
    }
    
    for i in 1 ... 1000000 {
        let splited: [Int] = String(i).map { String($0) }.map { Int($0)! }
        //print(splited)
        
        if i + splited.reduce(0, +) == n {
            print(i)
            return
        }
    }
    
    print(0)
}

solution()
