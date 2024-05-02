//
//  1202_보석도둑.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 5/2/24.
//

import Foundation

// 1202_needFix
// 3%에서 시간초과 발생.. 또 직접 자료구조 구현이 필요한건가?

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let jewelCount: Int = input[0]
    let bagCount: Int = input[1]
    
    // key 무게, value 가격
    var jewels: [(weight: Int, price: Int)] = []
    var bagWeightLimits: [Int] = []
    
    var result: Int = 0
    
    for _ in 0 ..< jewelCount {
        let jewelInfo = readLine()!.split(separator: " ").map { Int(String($0))! }
        jewels.append((jewelInfo[0], jewelInfo[1]))
    }
    
    for _ in 0 ..< bagCount {
        let bagInfo = Int(readLine()!)!
        bagWeightLimits.append(bagInfo)
    }
    
    bagWeightLimits.sort()
    
    for bagWeightLimit in bagWeightLimits {
        let highPriceJewel = jewels.filter { $0.weight <= bagWeightLimit }
            .max(by: {
                $0.price < $1.price
            })
        
        if let highPriceJewel = highPriceJewel {
            result += highPriceJewel.price
            
            if let index = jewels.firstIndex(where: {
                $0.price == highPriceJewel.price && $0.weight == highPriceJewel.weight
            }) {
                jewels.remove(at: index)
            }
            
            //print(result)
            //print(jewels)
        }
    }
    
    print(result)
}

solution()
