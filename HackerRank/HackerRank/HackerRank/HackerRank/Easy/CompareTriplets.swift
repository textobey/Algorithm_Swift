//
//  CompareTriplets.swift
//  HackerRank
//
//  Created by 이서준 on 7/31/24.
//

import Foundation

// url
// https://www.hackerrank.com/challenges/compare-the-triplets/problem

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var aliceScore: Int = 0
    var bobScore: Int = 0
    
    zip(a, b).forEach { aliceRating, bobRating in
        if aliceRating > bobRating {
            aliceScore += 1
        } else if aliceRating < bobRating {
            bobScore += 1
        }
    }
    
    return [aliceScore, bobScore]
}

print(compareTriplets(a: [5, 6, 7], b: [3, 6, 10]))
