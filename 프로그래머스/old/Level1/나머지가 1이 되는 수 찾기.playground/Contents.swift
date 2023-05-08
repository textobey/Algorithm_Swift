import Foundation

func solution(_ n:Int) -> Int {
    for i in 1 ..< n {
        if n % i == 1 {
            return i
        }
    }
    
    return 0
}

solution(10)
solution(12)


//3 | 2
//4 | 3
//5 | 4
//6 | 5
//7 | 6
//8 | 7
//9 | 8
//10 | 3
//11 | 2
//12 | 11
//13 | 2
//14 | 13
//15 | 2
