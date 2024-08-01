//
//  TimeConversion.swift
//  HackerRank
//
//  Created by 이서준 on 7/31/24.
//

import Foundation

// TimeConversion
// 아이디어1.
// PM, AM 포함 여부에 따라 +12 또는 -12를 해준뒤에 return 형식에 맞추는 방법
// 아이디어2.
// dateFormatter를 사용하여 형식을 정하고 반환하는 방법

func timeConversion(s: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm:ssa"
    
    let convertDate = dateFormatter.date(from: s)!
    dateFormatter.dateFormat = "HH:mm:ss"
    
    return dateFormatter.string(from: convertDate)
}

print(timeConversion(s: "07:05:45PM"))
