//
//  IcecreamPalor.swift
//  HackerRank
//
//  Created by 이서준 on 7/31/24.
//

import Foundation

// url
// https://www.hackerrank.com/challenges/icecream-parlor/problem

func icecreamPalor(m: Int, arr: [Int]) -> [Int] {
    
    for i in 0 ..< arr.count - 1 {
        for j in (i + 1) ..< arr.count {
            if arr[i] + arr[j] == m {
                return [(i + 1), (j + 1)]
            }
        }
    }
    
    return []
}

print(icecreamPalor(m: 4, arr: [1, 4, 5, 3, 2]))

print(icecreamPalor(m: 4, arr: [2, 2, 4, 3]))
