import UIKit

/*
 난이도: Level1
 길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.
 제한 조건
 n은 길이 10,000이하인 자연수입니다.
 입출력 예
 n    return
 3    "수박수"
 4    "수박수박"
*/

func solution(_ n:Int) -> String {
    var result = String(repeating: "수박", count: n / 2)
    if n % 2 != 0 {
        result.append("수")
    }
    return result
}

solution(3)
solution(4)
