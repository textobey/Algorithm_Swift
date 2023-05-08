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

func anothersSolution(_ number: [Int]) -> String {
    // ex) Int("6""10") > Int("10""6")를 기준으로 정렬함
    let sorted = number.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    // 정렬된 배열의 첫번째 요소가 0이라는것은 모든 배열이 0이라는 의미
    guard sorted[0] != 0 else { return "0" }
    
    return sorted.reduce("") { $0 + "\($1)" }
}

//solution([1, 10, 100, 1000])
//solution([6, 10, 2]) // 6210
//solution([3, 30, 34, 5, 9]) // 9534330

anothersSolution([1, 10, 100, 1000])
anothersSolution([6, 10, 2]) // 6210
anothersSolution([3, 30, 34, 5, 9]) // 9534330
