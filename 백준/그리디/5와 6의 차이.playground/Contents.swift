import Foundation

func solution() {
    let input = "16796 58786".split(separator: " ") //readLine()!.split(separator: " ")
    let a = input[0]
    let b = input[1]
    
    // 상근이가 모든 6을 5로 볼 경우 -> 최소값
    // 상근이가 모든 5를 6으로 볼 경우 -> 최대값
    let min = Int(a.replacingOccurrences(of: "6", with: "5"))! + Int(b.replacingOccurrences(of: "6", with: "5"))!
    
    let max = Int(a.replacingOccurrences(of: "5", with: "6"))! + Int(b.replacingOccurrences(of: "5", with: "6"))!
    
    print("\(min) \(max)")
}

solution()
