import UIKit

/*
 난이도: Level1
 
 문제 설명

 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
 (1은 소수가 아닙니다.)
 제한 조건
 n은 2이상 1000000이하의 자연수입니다.
 입출력 예
 n    result
 10    4
 5    3
 입출력 예 설명
 입출력 예 #1
 1부터 10 사이의 소수는 [2,3,5,7] 4개가 존재하므로 4를 반환
 입출력 예 #2
 1부터 5 사이의 소수는 [2,3,5] 3개가 존재하므로 3를 반환
*/

func solution(_ n: Int) -> Int {
    let numbers: [Int] = Array(2 ... n)
    var count: Int = 0
    
    for i in 0 ..< numbers.count {
        guard numbers[i] > 2 else { continue }
        for j in 2 ..< Int(sqrt(Double(numbers[i]))) + 1 {
            if numbers[i] % j == 0 {
                count += 1
                break
            }
        }
    }

    return numbers.count - count
}

solution(2)
solution(10)
solution(5)
