//
//  1339_단어수학.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/29.
//

import Foundation

// 1339_단어수학

// 예제를 다 맞는데, 왜 바로 fail이 발생하는거지..?
// Fix. 반례발견
// 2
// AB
// BB
//
// 위와 같이 주어졌을때, 98 + 88이 되어버림 결과는 186
// 근데 89 + 99로 만들어버리면 188로 더 높은수를 만들수있음
// 어떤 알파벳에 더 높은 숫자를 부여해줄지 정해주는 과정이 필요함
// 딕셔너리에 10^자릿수를 계속 누적해서 더하면
// A는 10이 될거고, B는 12가(10^1 + 1^1 + 1^1) 될거임
// [A: 10], [B: 12]
// 위의 과정을 통해, 어떤 얼파벳에 더 높은 숫자를 부여해줄지 정할수있음

func solution() {
    let n: Int = Int(readLine()!)!
    
    let nums: [Int] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    
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
        
        let importantScore = Int(pow(10.0, Double(maxLength - i - 1)))
        
        for j in 0 ..< combined[i].count {
            let letter = combined[i][j]
            dict[letter, default: 0] += importantScore
            //if dict[combined[i][j]] != nil {
            //    continue
            //}
            //dict.updateValue(nums.max()!, forKey: combined[i][j])
            //nums.removeFirst()
        }
    }
    
    dict.sorted { $0.value > $1.value }
        .enumerated()
        .forEach {
            let key = $0.element.key
            dict[key] = nums[$0.offset]
        }
    
    //print(dict)
    
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
