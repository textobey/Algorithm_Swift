import UIKit

/*
 난이도: Level1
 
 문제 설명

 문자열 s에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 문자열을 리턴하는 함수, solution을 완성해주세요.
 s는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.
 제한 사항
 str은 길이 1 이상인 문자열입니다.
 입출력 예
 s    return
 "Zbcdefg" "gfedcbZ"
 */

func solution(_ s:String) -> String {
    var lowerLetters = Array(s.filter { $0.isLowercase }).sorted(by: >)
    let upperLetters = Array(s.filter { $0.isUppercase }).sorted(by: >)
    upperLetters.forEach { lowerLetters.append($0) }
    return String(lowerLetters)
}

//solution("Zbcdefg")
solution("ZbcAdeBfCg")

func anothersSolution(_ s:String) -> String {
    String(s.sorted { $0 > $1 })
}
