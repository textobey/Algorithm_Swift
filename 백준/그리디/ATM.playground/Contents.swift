import Foundation

func solution() {
    //let n: Int = Int(readLine()!)! //5
    //let timeCost: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let timeCost: [Int] = [3, 1, 4, 3, 2]
    
    var temp: Int = 0
    
    timeCost.sorted(by: <).reduce(temp, { x, y in
        temp += (x + y)
        return x + y
    })
    
    print(temp)
    
}

solution() //32


