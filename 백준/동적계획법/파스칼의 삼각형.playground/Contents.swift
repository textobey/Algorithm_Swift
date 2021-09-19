import Foundation

/*
 문제
 파스칼의 삼각형은 이항계수를 삼각형 형태로 배열한 것인데, 블레즈 파스칼(1623-1662)을 따라 이름 붙여졌다.

 단순한 형태로, 파스칼의 삼각형은 다음과 같은 방법으로 만들 수 있다.

 N번째 행에는 N개의 수가 있다.
 첫 번째 행은 1이다.
 두 번째 행부터, 각 행의 양 끝의 값은 1이고, 나머지 수의 값은 바로 위 행의 인접한 두 수의 합이다.
 예를 들어, n=3이면 3번째 행의 2번째 수는 위 행의 인접한 두 수 (1과 1)을 더해서 만든다.

 n=6일 때, 파스칼 삼각형의 6번째 행의 10은 5번째 행의 인접한 두 수(4와 6)을 더해서 구한다.



 같은 방식으로 n=11일 때, 다음과 같은 파스칼의 삼각형을 만들 수 있다.



 정수 n과 k가 주어졌을 때 파스칼의 삼각형에 있는 n번째 행에서 k번째 수를 출력하는 프로그램을 작성하시오.  이때, 이 수는 이항계수 C(n-1,k-1)임에 주의하시오.

 입력
 첫째 줄에 정수 n과 k가 빈칸을 사이에 두고 차례로 주어진다. 이 때, 1 ≤ k ≤ n ≤ 30을 만족한다.

 출력
 첫째 줄에 n번째 행에 있는 k번째 수를 출력한다.
 */

func solution() {
    let n: String = String(readLine()!)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)
    
    for i in 0 ..< dp.count {
        /*
                1
               1
              1
             1
            ..
         */
        dp[i][0] = 1
    }
    for i in 1 ..< dp.count {
        for j in 1 ... i {
            /*
                    1
                   1 1
                  1 2 1
                 1 3 3 1
                1 4 6 4 1
               ...
             */
            dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
        }
    }
    let line = Int(n.components(separatedBy: " ")[0])!
    let number = Int(n.components(separatedBy: " ")[1])!
    
    print(dp[line - 1][number - 1])
}

solution()
