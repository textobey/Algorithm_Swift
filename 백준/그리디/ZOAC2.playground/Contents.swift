import Foundation

func solution() {
    print(UnicodeScalar("A").value) // 65
    print(UnicodeScalar("Z").value) // 90
    
    let str = readLine()!
    var start = 0
    var time = 0
    
    for s in str {
        let unicode = Int(s.asciiValue!) - 65 // 65를 빼면 A는 0이 된다.
        
        let n = abs(start - unicode) // (현재위치 - 글자위치)를 절대값으로 구한다.
        time += min(n, 26 - n) // 오른쪽으로 돌린 값과, 26을 빼서 반대로 돌린 값중 작인것을 더한다.
        start = unicode // 현재위치 변경
    }

    print(time)
}

solution()
