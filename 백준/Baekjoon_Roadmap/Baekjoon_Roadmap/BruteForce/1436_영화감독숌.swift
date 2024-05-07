//
//  1436_영화감독숌.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/07.
//

import Foundation

// 1436_영화감독숌

// 아이디어2.
// 666을 마지막 3자리를 가지는 수는 1000으로 나누는 나머지가 666임.
// 그런데, 반례가 있음.
// 6660-6669 같은 숫자들
// 이런 숫자도 666을 연속으로 가지고 있기 때문에, 확인해주기 위해
// 10으로 나누어서 6660 -> 666으로 만들고 1000으로 나눈 나머지를 다시 확인
//
// 666 1
// 1666 2
// 2666 3
// 3666 4
// 4666 5
// 5666 6
// 6660 7
// 6661 8
// 6662 9
// 6663 10
// 6664 11
// 6665 12
// 6666 13
// 6667 14
// 6668 15
// 6669 16
// 7666 17

func solution() {
    let series: Int = Int(readLine()!)!
    
    var num: Int = 666
    var count: Int = 0
    
    while count != series {
        var temp = num
        while temp >= 666 {
            if temp % 1000 == 666 {
                count += 1
                break
            }
            temp /= 10
        }
        if count == series {
            print(num)
            return
        }
        num += 1
    }
}

solution()


// 아이디어1.
// 시리즈는 아래의 규칙성을 가지고 영화를 출시하게 되는데,
// String(num).contains("666")을 활용하여 단순하게 체크해보았는데
// 시간효율성에 걸려 실패.
// series 숫자가 높을수록 contains 함수와 함께 타임 커브가 늘어나는 모양
//
// 666 1
// 1666 2
// 2666 3
// 3666 4
// 4666 5
// 5666 6
// 6660 7
//
//func solution() {
//    let series: Int = Int(readLine()!)!
//
//    var num: Int = 665
//
//    var count = 0
//
//    while count != series {
//        num += 1
//        if String(num).contains("666") {
//            count += 1
//        }
//    }
//
//    print(num)
//}
//
//solution()

