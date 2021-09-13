import UIKit

/*
 난이도: Level1
 
 문제 설명

 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.
 제한 사항
 n은 0 이상 3000이하인 정수입니다.
 입출력 예
 n    return
 12    28
 5    6
 입출력 예 설명
 입출력 예 #1
 12의 약수는 1, 2, 3, 4, 6, 12입니다. 이를 모두 더하면 28입니다.
 입출력 예 #2
 5의 약수는 1, 5입니다. 이를 모두 더하면 6입니다.
*/

func solution(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    var result: Int = 0
    for i in 1 ... n {
        if n % i == 0 {
            result += i
        }
    }
    return result
    
    // 아니 이거 왜 나만 시간초과 뜸?
    //return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}

solution(12)
