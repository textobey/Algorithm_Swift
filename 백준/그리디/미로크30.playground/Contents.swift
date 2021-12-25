import Foundation

func solution() {
    let n = "80875542"
    var sum = 0
    var hasZero: Bool = false
    
    let arrayOfn = Array(n)
    
    // *접근방법
    // 조건1. 3개의 배수는 각 자리의 합이 3의 배수여야함
    // 조건2. 10의 배수이기 때문에 끝자리는 0이어야함
    for i in 0 ..< n.count {
        sum += Int(String(arrayOfn[i]))!
        if Int(String(arrayOfn[i]))! == 0 {
            hasZero = true
        }
    }
    
    // 각 자리수의 합이 3 && 0이 포함(끝자리가 0이어야함)
    if (sum % 3 == 0 && hasZero) {
        // 만약, 위의 조건 2개가 모두 부합하다면, 가장 큰수로 정렬한 값이 가장큰 30의 배수임
        print(arrayOfn.sorted(by: >).map { String($0) }.joined())
        return
    }
    // 2개의 조건 중 하나라도 맞지 않으면, 30의 배수가 아님
    else {
        print("-1")
        return
    }
}

solution()
