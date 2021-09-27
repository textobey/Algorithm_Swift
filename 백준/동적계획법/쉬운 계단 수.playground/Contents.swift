import UIKit

/*
 N이 1자리일경우
 1 2 3 4 5 6 7 8 "9"
 
 N이 2자리일경우
  1   1  2  2   2   2  2  2  2
  2   1
 "10" 21 32 43 "54" 65 76 87 "98"
  12  23 34 45  56  67 78 89
 
 N이 3자리일경우
 "101" 210 321 432 "543" 654 765 876 987
     212 323 434 "545" 656 767 878 989
 121 232 343 454 565 676 787 898
 123 234 345 456 567 678 789
 
 위를 통해 알수있는 규칙, 낮은 자리 수의 계단수는 큰 자리 수의 계단수를 만드는 중요한 역할을 한다.
 0으로 시작하는 수는 없기 때문에, 1의 자리수가 0이나 9인 경우에는 다음 자릿수를 만들때 1개밖에 못 만든다.
 그 외의 수들은 2개씩 만들수있다.
 
 결국 N을 알면, N+1의 계단수를 알수있다. 1의 자리에 있는 값들의 개수만 기억하면 N의 값에 따라 계단수의 개수를 구할수있다.
 */

func solution() {
    let n: Int = Int(readLine()!)! //3
    let mod = 1000000000
    if n == 1 {
        print(9)
        return
    } else {
        var result: Int = 0
        var dp1 = [Int](repeating: 1, count: 10)
        var dp2 = [Int](repeating: 0, count: 10)
        dp1[0] = 0
        
        for i in 1 ..< n {
            for j in 0 ..< dp1.count {
                // i가 짝수일 경우
                if i % 2 == 0 {
                    if j == 0 {
                        dp1[0] = (dp2[1] % mod)
                    } else if j == 9 {
                        dp1[9] = (dp2[8] % mod)
                    } else {
                        dp1[j] = (dp2[j + 1] + dp2[j - 1]) % mod
                    }
                } else {
                    if j == 0 {
                        dp2[0] = (dp1[1] % mod)
                    } else if j == 9 {
                        dp2[9] = (dp1[8] % mod)
                    } else {
                        dp2[j] = (dp1[j + 1] + dp1[j - 1]) % mod
                    }
                }
            }
        }
        
        if n % 2 == 1 {
            result += dp1.reduce(0, +)
        } else {
            result += dp2.reduce(0, +)
        }
        
        return print(result % mod)
    }
}

solution()
