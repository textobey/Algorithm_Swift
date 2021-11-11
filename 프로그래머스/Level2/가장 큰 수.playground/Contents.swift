import Foundation

func solution(_ numbers: [Int]) -> String {
    let maxLength = String(numbers.max()!).count
    if maxLength <= 1 {
        return numbers.map { String($0) }.joined()
    }
    
    let tuples = numbers.map { (String($0).count == maxLength,
                                String($0).count != maxLength ? addZero($0, maxLength) : ($0, 0) )}
    
    return tuples.sorted { $0.1 > $1.1 }
        .map { minusZero($0.1.0, $0.1.1) }
        .map { String($0) }
        .joined()
}

func addZero(_ num: Int, _ repeatCount: Int) -> (Int, Int) {
    var stringOfnum = String(num)
    var upCount: Int = 0
    (0 ..< (repeatCount - stringOfnum.count)).forEach { _ in
        stringOfnum += "0"
        upCount += 1
    }
    return (Int(stringOfnum)!, upCount)
}

func minusZero(_ num: Int, _ repeatCount: Int) -> Int {
    var stringOfnum = String(num)
    (0 ..< repeatCount).forEach { _ in
        stringOfnum.removeLast()
    }
    return Int(stringOfnum)!
}

solution([1, 10, 100, 1000])
//solution([6, 10, 2]) // 6210
//solution([3, 30, 34, 5, 9]) // 9534330
