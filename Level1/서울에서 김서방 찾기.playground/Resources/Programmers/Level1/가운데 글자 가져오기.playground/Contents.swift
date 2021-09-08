import UIKit

/*
 난이도: Level1
 
 [문제 설명]
 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

 재한사항
 s는 길이가 1 이상, 100이하인 스트링입니다.
 입출력 예
 s    return
 "abcde"    "c"
 "qwer" "we"
*/

func solution(_ s: String) -> String {
    let array: [String.Element] = Array(s)
    
    if s.count % 2 != 0 {
        return String(array[s.count / 2])
    } else {
        return String(array[(s.count / 2) - 1 ... s.count / 2])
    }
}

solution("abcde")
solution("qwer")
