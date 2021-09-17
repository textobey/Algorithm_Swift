import UIKit

/*
 문제
 여러 개의 사과, 파인애플, 그리고 펜이 일렬로 세워져 있다. 이 물건들의 순서를 바꾸지 않고 옆에 있는 물건끼리 연결했을 때, 펜-파인애플-애플-펜을 몇 개나 만들 수 있을지 세어보자.

 단, 펜, 파인애플, 사과, 펜 순서로 연결된 네 개의 물건만을 펜-파인애플-애플-펜으로 인정하며, 하나의 펜이 두 개의 펜-파인애플-애플-펜에 포함될 수 없다. 또한 펜, 사과, 파인애플, 펜 순서로 연결된 네 개의 물건은 펜-파인애플-애플-펜이 아니다.

 입력
 첫 번째 줄에 물건의 총 개수 n이 주어진다. (1 ≤ n ≤ 1,000,000)

 두 번째 줄에 물체의 목록이 길이 n의 문자열로 주어진다. 사과는 A로, 파인애플은 P로, 펜은 p로 대소문자를 구분하여 표기한다.

 출력
 만들 수 있는 펜-파인애플-애플-펜의 최대 개수를 출력한다.
 */

func solution() {
    let n: Int = Int(readLine()!)!
    let temp: [String] = readLine()! //"pPApPAp"
        .replacingOccurrences(of: "pPAp", with: "pPAp ")
        .replacingOccurrences(of: "pPAp", with: " pPAp")
        .components(separatedBy: " ")

    print(temp.filter { $0 == "pPAp" }.count)
}

solution()
