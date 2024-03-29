//
//  2309_일곱난쟁이.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    var heights: [Int] = []
    
    for _ in 0 ..< 9 {
        let height = Int(readLine()!)!
        heights.append(height)
    }
   
    let overHeight = heights.reduce(0, +) - 100
    
    var fakerHeights: [Int] = []
    
    loop: for i in 0 ..< heights.count - 1 {
        for j in i + 1 ..< heights.count {
            if overHeight == heights[i] + heights[j] {
                fakerHeights.append(heights[i])
                fakerHeights.append(heights[j])
                break loop
            }
        }
    }
    
    fakerHeights.forEach { height in
        heights.remove(at: heights.firstIndex(of: height)!)
    }
    
    heights.sorted(by: <).forEach {
        print($0)
    }
}

solution()
