import UIKit

func solution() {
    let him = readLine()!//"CJM"
    let her = readLine()!//"HER"
    var nameArray = [Int]()
    for i in 0 ..< him.count {
        nameArray.append(change(String(Array(him)[i])))
        nameArray.append(change(String(Array(her)[i])))
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: nameArray.count), count: nameArray.count)
    dp[0] = nameArray
    
    for i in 1 ..< nameArray.count {
        for j in 1 ..< dp.count {
            dp[i][j - 1] = dp[i - 1][j - 1] + dp[i - 1][j]
            if dp[i][j - 1] >= 10 {
                dp[i][j - 1] -= 10
            }
        }
        if i == nameArray.count - 2 {
            break
        }
    }
    
    print("\(dp[dp.count - 2][0])\(dp[dp.count - 2][1])")
}

func change(_ s: String) -> Int {
    switch s {
    case "A": return 3
    case "B": return 2
    case "C": return 1
    case "D": return 2
        
    case "E": return 3
    case "F": return 3
    case "G": return 2
    case "H": return 3
        
    case "I": return 3
    case "J": return 2
    case "K": return 2
    case "L": return 1
        
    case "M": return 2
    case "N": return 2
    case "O": return 1
    case "P": return 2
        
    case "Q": return 2
    case "R": return 2
    case "S": return 1
    case "T": return 2
        
    case "U": return 1
    case "V": return 1
    case "W": return 1
    case "X": return 2
    case "Y": return 2
    case "Z": return 1
    default:
        return 0
    }
}

solution()


//import UIKit
//
//func solution() {
//    let him = "CJM"
//    let her = "HER"
//    var sum: String = ""
//    for i in 0 ..< him.count {
//        sum += String(Array(him)[i])
//        sum += String(Array(her)[i])
//    }
//
//    var nameArray = [Int](repeating: 0, count: sum.count)
//    for i in 0 ..< nameArray.count {
//        nameArray[i] = chnage(String(Array(sum)[i]))
//    }
//
//    var dp = Array(repeating: Array(repeating: 0, count: nameArray.count), count: nameArray.count)
//    dp[0] = nameArray
//
//    for i in 1 ..< sum.count {
//        for j in 1 ..< dp.count {
//            dp[i][j - 1] = dp[i - 1][j - 1] + dp[i - 1][j]
//            if dp[i][j - 1] >= 10 {
//                dp[i][j - 1] -= 10
//            }
//        }
//        if i == sum.count - 2 {
//            break
//        }
//    }
//
//    print("\(dp[sum.count - 2][0])\(dp[sum.count - 2][1])")
//}
//
//func chnage(_ s: String) -> Int {
//    switch s {
//    case "A": return 3
//    case "B": return 2
//    case "C": return 1
//    case "D": return 2
//
//    case "E": return 3
//    case "F": return 3
//    case "G": return 2
//    case "H": return 3
//
//    case "I": return 3
//    case "J": return 2
//    case "K": return 2
//    case "L": return 1
//
//    case "M": return 2
//    case "N": return 2
//    case "O": return 1
//    case "P": return 2
//
//    case "Q": return 2
//    case "R": return 2
//    case "S": return 1
//    case "T": return 2
//
//    case "U": return 1
//    case "V": return 1
//    case "W": return 1
//    case "X": return 2
//    case "Y": return 2
//    case "Z": return 1
//    default:
//        return 0
//    }
//}
//
//solution()
