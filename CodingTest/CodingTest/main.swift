//
//  main.swift
//  CodingTest
//
//  Created by 이서준 on 2023/05/11.
//

// 문제 설명
// 비밀지도
// 네오는 평소 프로도가 비상금을 숨겨놓는 장소를 알려줄 비밀지도를 손에 넣었다.
// 그런데 이 비밀지도는 숫자로 암호화되어 있어 위치를 확인하기 위해서는 암호를 해독해야 한다.
// 다행히 지도 암호를 해독할 방법을 적어놓은 메모도 함께 발견했다.

// 지도는 한 변의 길이가 n인 정사각형 배열 형태로, 각 칸은 "공백"(" ") 또는 "벽"("#") 두 종류로 이루어져 있다.
// 전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 "지도 1"과 "지도 2"라고 하자.
// 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다. 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다.

// ..중략
// 링크: https://school.programmers.co.kr/learn/courses/30/lessons/17681

import Foundation

func solution(_ a: Int, _ b: Int) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.locale = Locale(identifier: "eng")
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    let date = dateFormatterGet.date(from:"2016-\(a)-\(b)")
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "eng")
    // E: "Tue"
    // EEEE: "Tuesday"
    // EEEEE: "T"
    // EEEEEE: "Tu"
    dateFormatter.dateFormat = "E"
    return dateFormatter.string(from:date!).uppercased()
}

solution(5, 24)
