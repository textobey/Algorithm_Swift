//
//  1744_수묶기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/30/24.
//

import Foundation

// 1744 수 묶기

func solution() {
    
    let n: Int = Int(readLine()!)!
    
    var nums: [Int] = []
    var result: Int = 0
    
    for _ in 0 ..< n {
        let num = Int(readLine()!)!
        nums.append(num)
    }
    
    if nums.count == 1 {
        print(nums.first!)
        return
    }
    
    nums.sort()
    
    // needFix.
    // 현재 떠오르는 아이디어는
    // nums가 홀수일경우에 last를 더할지
    // 아니면 제일 작은수를 0을 곱하거나 마이너스끼리 곱해서 양전시키는게 이득일지 계산해야함
    // 반례
    //    3
    //    1
    //    2
    //    3
    //
    //    # Output
    //    6
    //
    //    # Answer
    //    7
    //
    //    ///////////////////////////////////////
    //    7
    //    3
    //    2
    //    1
    //    1
    //    0
    //    0
    //    -3
    //
    //    # Output
    //    7
    //
    //    # Answer
    //    8
    for i in 0 ..< nums.count {
        if i % 2 == 0 {
            continue
        }

        let plusNum = nums[i - 1] + nums[i]
        let multipleNum = nums[i - 1] * nums[i]
        
        result += max(plusNum, multipleNum)
    }
    
    if nums.count % 2 == 1 {
        print(result + nums.last!)
    } else {
        print(result)
    }
}

solution()
