//
//  1744_수묶기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/30/24.
//

import Foundation

func solution() {
    
    let n: Int = Int(readLine()!)!
    
    var minusNums: [Int] = []
    var plusNums: [Int] = []
    
    var result: Int = 0
    
    for _ in 0 ..< n {
        let num = Int(readLine()!)!
        if num > 1 {
            plusNums.append(num)
        }
        // 고려를 못한게 있는데, 1은 무조건 더해줘야 더 큰 수를 만들수있음.
        else if num == 1 {
            result += 1
        } else {
            // 0도 마이너스에 포함, 0은 마이너스 숫자 배열중에선 가장 큰 수임
            minusNums.append(num)
        }
    }
    
    plusNums.sort(by: >)
    minusNums.sort(by: <)
    
    // 홀수인 경우에 가장 큰 수를 만드는데에 기여도가 제일 낮은 숫자는 제외하기 위함
    if plusNums.count % 2 == 1 {
        result += plusNums.removeLast()
    }
    
    // 마이너스의 경우 제일 큰 음수라도 짝수로만 맞춰준다면? 가장 큰 수가 될 수 있음
    if minusNums.count % 2 == 1 {
        result += minusNums.removeLast()
    }
    
    while plusNums.count > 0 || minusNums.count > 0 {
        if plusNums.count > 0 {
            // plusNums[plusNums.endIndex - 1] * plusNums[plusNums.endIndex - 2]
            result += plusNums.removeLast() * plusNums.removeLast()
        }
        
        if minusNums.count > 0 {
            result += minusNums.removeLast() * minusNums.removeLast()
        }
    }
    
    print(result)
}

solution()

// 1744 수 묶기
// 아래는 초기 아이디어.. 접근 방법에 너무 많은 반례를 고려해야해서 실패.
// 특히 입력수가 홀수로 주어질때, 0번째 인덱스와 1번째 인덱스를 곱하는게 더 큰수가 될지
// 0번째 인덱스를 버리고 나머지를 곱하는게 더 큰수가 될지 고려해야하는 등 반례가 많음

//func solution() {
//
//    let n: Int = Int(readLine()!)!
//
//    var nums: [Int] = []
//    var result: Int = 0
//
//    for _ in 0 ..< n {
//        let num = Int(readLine()!)!
//        nums.append(num)
//    }
//
//    if nums.count == 1 {
//        print(nums.first!)
//        return
//    }
//
//    nums.sort()
//
//    // needFix.
//    // 현재 떠오르는 아이디어는
//    // nums가 홀수일경우에 last를 더할지
//    // 아니면 제일 작은수를 0을 곱하거나 마이너스끼리 곱해서 양전시키는게 이득일지 계산해야함
//    // 반례
//    //    3
//    //    1
//    //    2
//    //    3
//    //
//    //    # Output
//    //    6
//    //
//    //    # Answer
//    //    7
//    //
//    //    ///////////////////////////////////////
//    //    7
//    //    3
//    //    2
//    //    1
//    //    1
//    //    0
//    //    0
//    //    -3
//    //
//    //    # Output
//    //    7
//    //
//    //    # Answer
//    //    8
//
//    if nums.count % 2 == 1 {
//        result += nums.first ?? 0
//        nums.removeFirst()
//    }
//
//    for i in 0 ..< nums.count {
//
//        if i % 2 == 0 {
//            continue
//        }
//
//        let plusNum = nums[i - 1] + nums[i]
//        let multipleNum = nums[i - 1] * nums[i]
//
//        result += max(plusNum, multipleNum)
//    }
//
//    print(result)
//
////    if nums.count % 2 == 1 {
////        print(result + nums.last!)
////    } else {
////        print(result)
////    }
//}
//
//solution()
