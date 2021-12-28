import Foundation

func solution() {
    let _ = readLine()
    let ice = readLine()!.components(separatedBy: "-1")
    let left = ice[0].split(separator: " ").compactMap { Int($0) }
    let right = ice[1].split(separator: " ").compactMap { Int($0) }
    
    print(left.min()! + right.min()!)
}

solution()


