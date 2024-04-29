//
//  1715_카드정렬하기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/29.
//

import Foundation

// 1715_카드정렬하기
// need heap... swift 시간초과

// 나의 아이디어
// 10, 20, 40, 50이 주어질때 더했을경우 가장 낮은 수를 구한다.
// 즉, (10 + 20)으로 30의 카드 더미를 구한다.
// 그리고, 30(10 + 20) + (30 + 40)을 만든다.
// 이제 [30, 40, 50]의 카드 더미를 가지게 된다.
// (30 + 40) -> 70의 카드 더미가 생긴다.
// 이때, 카드더미가 생길때마다 낮은 순으로 정렬하여 더했을때 가장 낮을 수를 구해야한다.
// 만약 카드 정렬이 안되어서 [70, 50]이 된 경우, 뒤에 카드가 더 있다면 꼬이게 될것이다.
// [50, 70]으로 정렬하여 이 과정을 반복한다.

// 대충 아이디어는 맞는거 같은데..heap을 구현해야한다.
// heap 우선순위 큐에 대해 이해가 있어야 할거같다.

func solution() {
    let decks: Int = Int(readLine()!)!
    
    var deckCounts: [Int] = []
    var combinedArray: [Int] = [0]
    //var combinedCount: Int = 0
    
    for _ in 0 ..< decks {
        let count = Int(readLine()!)!
        deckCounts.append(count)
    }
    
    while deckCounts.count > 1 {
        deckCounts.sort(by: <)
        
        let deck1 = deckCounts[deckCounts.startIndex]
        let deck2 = deckCounts[deckCounts.startIndex + 1]
        
        deckCounts.remove(at: deckCounts.startIndex)
        deckCounts.remove(at: deckCounts.startIndex)
        
        combinedArray.append(deck1)
        combinedArray.append(deck2)
        
        deckCounts.append(deck1 + deck2)

        //print(combinedArray)
    }
    
    //print(deckCounts)
    print(combinedArray.reduce(0, +))
}

solution()
