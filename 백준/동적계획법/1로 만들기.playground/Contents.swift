import UIKit

/*
 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.

 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

 입력
 첫째 줄에 1보다 크거나 같고, 106보다 작거나 같은 정수 N이 주어진다.

 출력
 첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.
 */

/*
 1 -> 이미 1 이므로 0이 출력
 2 -> 2 / 2 = 1 -> 1 출력
 3 -> 3 / 3 = 1 -> 1 출력
 4 -> 4 / 2 = 2 / 2 = 1 -> 2 출력
 5 -> 5 - 1 = 4 / 2 = 2 / 2 = 1 -> 3 출력
 
 어떤수라도 4이상의 수는 1을 빼거나, 2 또는 3으로 나누면 이미 그 전에 구한값이 존재하기 때문에 1을 더해준 값이 정답
*/

func solution() -> Int {
    let n: Int = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: n + 1)
    
    for i in 2 ..< n + 1 {
        dp[i] = dp[i - 1] + 1
        if i % 3 == 0 {
            // 1을 빼서 구한값이 작은지, 3으로 나눈값이 작은지 비교함
            dp[i] = min(dp[i], dp[i / 3] + 1)
        }
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i / 2] + 1)
        }
    }
    
    return n == 1 ? 0 : dp[n]
}

print(solution())


