import UIKit

/*
 fibonacci(3)을 호출하면 다음과 같은 일이 일어난다.

 fibonacci(3)은 fibonacci(2)와 fibonacci(1) (첫 번째 호출)을 호출한다.
 fibonacci(2)는 fibonacci(1) (두 번째 호출)과 fibonacci(0)을 호출한다.
 두 번째 호출한 fibonacci(1)은 1을 출력하고 1을 리턴한다.
 fibonacci(0)은 0을 출력하고, 0을 리턴한다.
 fibonacci(2)는 fibonacci(1)과 fibonacci(0)의 결과를 얻고, 1을 리턴한다.
 첫 번째 호출한 fibonacci(1)은 1을 출력하고, 1을 리턴한다.
 fibonacci(3)은 fibonacci(2)와 fibonacci(1)의 결과를 얻고, 2를 리턴한다.
 1은 2번 출력되고, 0은 1번 출력된다. N이 주어졌을 때, fibonacci(N)을 호출했을 때, 0과 1이 각각 몇 번 출력되는지 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 테스트 케이스의 개수 T가 주어진다.

 각 테스트 케이스는 한 줄로 이루어져 있고, N이 주어진다. N은 40보다 작거나 같은 자연수 또는 0이다.

 출력
 각 테스트 케이스마다 0이 출력되는 횟수와 1이 출력되는 횟수를 공백으로 구분해서 출력한다.
 */

func solution() {
    let n: Int = Int(readLine()!)!
    var testCase: [Int] = []
    
    // 첫줄에 입력받은수만큼 테스트 진행
    for _ in 0 ..< n {
        testCase.append(Int(readLine()!)!)
    }
    
    var result: [(Int, Int)] = [(Int, Int)](repeating: (0, 0), count: 41)
    result[0] = (1, 0)
    result[1] = (0, 1)
    /* 찾을수있는 규칙성 : 0, 1을 제외하고는 n-1과 n-2의 개수를 더한다.
    N = 0 -> 1 0
    N = 1 -> 0 1
    N = 2 -> 1 1
    N = 3 -> 2 2
    N = 4 -> 3 3
    */
    
    for i in 2 ..< result.count {
        result[i] = (result[i - 1].0 + result[i - 2].0, result[i - 1].1 + result[i - 2].1)
    }
    
    for tc in testCase {
        print("\(result[tc].0) \(result[tc].1)")
    }
}

solution()
