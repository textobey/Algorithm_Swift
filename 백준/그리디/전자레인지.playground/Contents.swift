import UIKit

func solution() {
    let time: Int = 100
    //A 300초 B 60초 C 10초
    var result: (a: Int, b:Int, c:Int) = (0, 0, 0)
    
    if time % 10 != 0 {
        // 제일 작은 10초로도 딱 맞추어 나눌수 없다면, 불가능한 시간임
        print("-1")
        return
    } else {
        result.a = time / 300
        result.b = (time % 300) / 60
        result.c = ((time % 300) % 60) / 10
    }
    print(result)
}

solution()
