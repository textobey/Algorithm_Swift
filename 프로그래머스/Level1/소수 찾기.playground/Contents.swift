import UIKit

// 문제 설명
// 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.

// 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
// (1은 소수가 아닙니다.)

// 제한 조건
// n은 2이상 1000000이하의 자연수입니다.

// 입출력 예
// n    result
// 10    4
// 5    3

// 입출력 예 설명
// 입출력 예 #1
// 1부터 10 사이의 소수는 [2,3,5,7] 4개가 존재하므로 4를 반환

// 입출력 예 #2
// 1부터 5 사이의 소수는 [2,3,5] 3개가 존재하므로 3를 반환


func solution(_ n: Int) -> Int {
    return (1 ... n).filter { isPrime(num: $0) }.count
    //하나씩 나누어보며 시행착오를 통해 구하는 방법
    //return (2 ... n).compactMap { num -> Int? in
    //    return (1 ... num).map { num % $0 == 0 }.filter { $0 }.count == 2 ? num : nil
    //}.count
}

func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2 ... Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

solution(10)
solution(5)
//solution(1000000)
