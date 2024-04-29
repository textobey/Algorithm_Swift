//
//  1339_단어수학.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/29.
//

import Foundation

// 1339_단어수학
// needFix
// 예제를 다 맞는데, 왜 바로 fail이 발생하는거지..?

func solution() {
    let n: Int = Int(readLine()!)!
    
    var nums: [Int] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    
    var words: [String] = []
    var maxLength: Int = 0
    
    for _ in 0 ..< n {
        let word = readLine()!
        words.append(word)
        maxLength = max(maxLength, word.count)
    }
    
    var combined: [[String]] = Array(repeating: [], count: maxLength)
    
    for word in words {
        word.map { String($0) }.enumerated().forEach {
            if word.count < maxLength {
                combined[maxLength - word.count + $0.offset].append($0.element)
            } else {
                combined[$0.offset].append($0.element)
            }
        }
    }
    
    var dict: [String: Int] = [:]
    
    for i in 0 ..< combined.count {
        for j in 0 ..< combined[i].count {
            if dict[combined[i][j]] != nil {
                continue
            }
            dict.updateValue(nums.max()!, forKey: combined[i][j])
            nums.removeFirst()
        }
    }
    
    var results: [Int] = []
    
    for word in words {
        var temp: String = ""
        word.map { String($0) }.enumerated().forEach {
            temp += String(dict[$0.element]!)
        }
        results.append(Int(temp)!)
    }
    
    //print(results)
    
    print(results.reduce(0, +))
}

solution()
