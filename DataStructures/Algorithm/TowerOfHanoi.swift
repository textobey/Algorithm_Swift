//
//  TowerOfHanoi.swift
//  DataStructures
//
//  Created by 이서준 on 2023/09/18.
//

import Foundation

// 재귀적으로 생각하기.
// 하노이탑은 대표적인 하향식 계산 방식의 강력함을 보여줄 수 있는 아주 좋은 예제.

class TowerOfHanoi {
    
    var result: [[Int]] = []
    
    func soulution(_ n: Int) -> [[Int]] {
        hanoi(n: n, from: 1, to: 3, assist: 2)
        return result
    }
    
    private func hanoi(n: Int, from: Int, to: Int, assist: Int) {
        if n == 1 {
            //move(from: from, to: to)
            result.append([from, to])
            return
        }
        
        // from 기둥에 남은 n개 중 n - 1개를 assist 기둥에 옮긴다. to기둥으로 보조로 사용
        hanoi(n: n - 1, from: from, to: assist, assist: to)
        
        // from 기둥에 남은 가장 큰 원판을 to 기둥으로 옮긴다.
        //move(from: from, to: to)
        result.append([from, to])
        
        // assist 기둥에 남은 n개 중 n - 1개를 to 기둥에 옮긴다. from기둥으로 보조로 사용
        hanoi(n: n - 1, from: assist, to: to, assist: from)
    }
}
