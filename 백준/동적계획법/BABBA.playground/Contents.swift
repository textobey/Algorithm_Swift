import UIKit

/*
 문제
 상근이는 길을 걷다가 신기한 기계를 발견했다. 기계는 매우 매우 큰 화면과 버튼 하나로 이루어져 있다.

 기계를 발견했을 때, 화면에는 A만 표시되어져 있었다. 버튼을 누르니 글자가 B로 변했다. 한 번 더 누르니 BA로 바뀌고, 그 다음에는 BAB, 그리고 BABBA로 바뀌었다. 상근이는 화면의 모든 B는 BA로 바뀌고, A는 B로 바뀐다는 사실을 알게되었다.

 버튼을 K번 눌렀을 때, 화면에 A와 B의 개수는 몇 개가 될까?

 입력
 첫째 줄에 K (1 ≤ K ≤ 45)가 주어진다.

 출력
 첫째 줄에 A의 개수와 B의 개수를 공백으로 구분해 출력한다.
 */

/*
 
 A
 B 1
 BA 2
 BAB 3
 BAB BA 4
 BAB BAB AB 5
 BAB BAB AB BAB BA 6
 */

func solution() {
    let n: Int = Int(readLine()!)!
    //    dp[0] = "A" (1, 0)
    //    dp[1] = "B" (0, 1)
    //    dp[2] = "BA" (1, 1)
    //    dp[3] = "BAB" (1, 2)
    //    dp[4] = "BABBA" (2, 3)
    var result = (1, 0)
    for _ in 0 ..< n {
        var temp = (0, 0)
        temp.0 += result.1
        temp.1 += result.1 + result.0
        result = temp
    }
    print(result.0, result.1)
}

solution()
