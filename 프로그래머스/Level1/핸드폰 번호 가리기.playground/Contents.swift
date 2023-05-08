import UIKit

//문제 설명
// 프로그래머스 모바일은 개인정보 보호를 위해 고지서를 보낼 때 고객들의 전화번호의 일부를 가립니다.
// 전화번호가 문자열 phone_number로 주어졌을 때, 전화번호의 뒷 4자리를 제외한 나머지 숫자를 전부 *으로 가린 문자열을 리턴하는 함수, solution을 완성해주세요.

// 제한 조건
// phone_number는 길이 4 이상, 20이하인 문자열입니다.

// 입출력 예
// phone_number    return
// "01033334444"    "*******4444"
// "027778888"    "*****8888"

func solution(_ phone_number: String) -> String {
    guard phone_number.count > 4 else { return phone_number }
    
    let displayNumberIndex = phone_number.index(phone_number.endIndex, offsetBy: -5)
    let blindNumber = String(phone_number[...displayNumberIndex])
    
    return phone_number.replacingOccurrences(of: blindNumber, with: String(repeating: "*", count: blindNumber.count))
}

solution("01033334444")
solution("027778888")
solution("1234")
solution("12345")
solution("12345678901234567890")
