import UIKit

// Level2
/*
 문제 설명

 124 나라가 있습니다. 124 나라에서는 10진법이 아닌 다음과 같은 자신들만의 규칙으로 수를 표현합니다.
 124 나라에는 자연수만 존재합니다.
 124 나라에는 모든 수를 표현할 때 1, 2, 4만 사용합니다.
 예를 들어서 124 나라에서 사용하는 숫자는 다음과 같이 변환됩니다.
 10진법    124 나라    10진법    124 나라
 1    1    6    14
 2    2    7    21
 3    4    8    22
 4    11    9    24
 5    12    10    41
 자연수 n이 매개변수로 주어질 때, n을 124 나라에서 사용하는 숫자로 바꾼 값을 return 하도록 solution 함수를 완성해 주세요.
 제한사항
 n은 500,000,000이하의 자연수 입니다.

 */

/*
 입출력 예
 n    result
 1    1
 2    2
 3    4
 4    11
 */

func solution(n: Int) -> String {
    var n = n
    var answer = ""
    
    // 3으로 나눈 나머지를 answer로 넣되, 나머지가 0이라면 4로 대체함.
    // 나머지가 0이 될때까지 나눠준다.
    while(n > 0) {
        var mod = n % 3
        n = n / 3
        if mod == 0 {
            mod = 4
            n -= 1
        }
        print("\(mod)" + "\(answer)")
        answer = "\(mod)" + "\(answer)"
    }
    
    return answer
}

solution(n: 7)
// 4 % 3 = 1 -> 1
// 10 / 3

// 4 + 1
