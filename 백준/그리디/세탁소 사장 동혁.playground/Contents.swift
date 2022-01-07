import Foundation

func solution() {
    let n = 3
    var t = [124, 25, 194]
    //let coins: [Int] = [25, 10, 5]
    
    for i in 0 ..< n {
        var temp = ""
        temp += "\(t[i] / 25) "
        t[i] = t[i] % 25
        temp += "\(t[i] / 10) "
        t[i] = t[i] % 10
        temp += "\(t[i] / 5) "
        temp += "\(t[i] % 5)"
        print(temp)
    }
}

solution()
