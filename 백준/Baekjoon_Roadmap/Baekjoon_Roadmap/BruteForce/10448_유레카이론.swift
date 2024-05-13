//
//  10448_유레카이론.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/13.
//

import Foundation

// 10448_유레카이론
//
// 아이디어.
// 3 <= K <= 1000의 조건에 따라
// 삼각수 1000까지 모두 생성해놓으면 테스트케이스가 많아도 효율적임(DP)
// Tn이 44라면 44(44 + 1) / 2 = 990
// Tn이 45라면 45(45 + 1) / 2 = 1035
// 즉 T^45의 삼각수까지는 미리 만들어놓고 시작
//
// Tn의 삼각수는 이전 Tn의 삼각수 + n이다.
// 숫자가 중첩이 되어도 되기 때문에, 3개를 뽑아 K를 만들수있는 모든 경우의수를 확인

func solution() {
    let testCase: Int = Int(readLine()!)!
    
    var dp: [(order: Int, num: Int)] = []
    
    dp.append((1, 1))
    
    var nums: [Int] = []
    
    for i in 1 ..< 45 {
        let order = i + 1
        dp.append((order, dp[i - 1].num + order))
    }
    
    for _ in 0 ..< testCase {
        let num = Int(readLine()!)!
        nums.append(num)
    }
    
    for num in nums {
        var isEureka: Int = 0

        loop: for i in 0 ..< dp.count {
            for j in i ..< dp.count {
                for k in j ..< dp.count {
                    let sum = dp[i].num + dp[j].num + dp[k].num
                    if sum == num {
                        //print(dp[i], dp[j], dp[k])
                        isEureka = 1
                        break loop
                    }
                }
            }
        }
        
        print(isEureka)
    }
}

solution()
