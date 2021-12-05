import Foundation

func solution() {
    let string = "55-50+40"//readLine()!
    let separated = string.components(separatedBy: "-")
    var minusNumbers = [Int]()
    
    // + 연산후에, - 연산을 하면 최소값을 얻을수있음.
    for num in separated {
        let numbers = num.components(separatedBy: "+").map { Int($0)! }
        minusNumbers.append(numbers.reduce(0, +))
    }

    var result = minusNumbers[0]
    for i in 1 ..< minusNumbers.count {
        result -= minusNumbers[i]
    }

    print(result)
}

solution()
