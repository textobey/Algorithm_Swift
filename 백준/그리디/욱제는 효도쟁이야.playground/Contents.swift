import Foundation

func solution() {
    let n = Int(readLine()!)
    let costs = readLine()!.split(separator: " ").map { Int($0)! }
    
    // 모든 마을에 이동 경비를 더하고, 가장 큰 경비를 계획에서 제외함.
    print(costs.reduce(0, +) - costs.max()!)
}

solution()
