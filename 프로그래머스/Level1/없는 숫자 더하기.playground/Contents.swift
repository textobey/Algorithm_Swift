import Foundation

func solution(_ numbers:[Int]) -> Int {
    let compare: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    return compare.subtracting(numbers).reduce(0, +)
}

solution([1, 2, 3, 4, 6, 7, 8, 0])
