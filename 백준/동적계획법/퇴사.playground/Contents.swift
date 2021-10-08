import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var counsle: [[Int]] = []
    for _ in 0..<n {
        counsle.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    var dp: [Int] = [Int](repeating: 0, count: n+1)
    
    var nextJob: [Int] = [Int](repeating: 0, count: n+1)
    for i in 0..<n {
        nextJob[i] = i + counsle[i][0]
    }
    
    for i in 0..<n {
        if nextJob[i] > n {
            continue
        }
        for j in nextJob[i]...n {
            dp[j] = max(dp[j], dp[i] + counsle[i][1])
        }
    }
    
    print(dp.max()!)
}

solution()

//func solution() {
//    let n = Int(readLine()!)!
//    let
//    //var day: [Int] = []
//    //var pay: [Int] = []
//
////    for _ in 0 ..< n {
////        let value = readLine()!.components(separatedBy: " ")
////        day.append(Int(value[0])!)
////        pay.append(Int(value[1])!)
////    }
//    //let day = [3, 5, 1, 1, 2, 4, 2]
//    //let pay = [10, 20, 10, 20, 15, 40, 200]
//    //let day = [5, 4, 3, 2, 1, 1, 2, 3, 4, 5]
//    //let pay = [50, 40, 30, 20, 10, 10, 20, 30, 40, 50]
//
//    var dp = [Int](repeating: 0, count: n + 1)
//
//    for i in (0 ..< n - 1).reversed() {
//        //print(i + day[i], n)
//        if i + day[i] > n {
//            dp[i] = dp[i - 1]
//        } else {
//            //dp[7] = max(dp[8], pay[7] + dp[7 + 3]
//            dp[i] = max(dp[i + 1], pay[i] + dp[i + day[i]])
//        }
//    }
//
//    //print(dp)
//    print(dp.max()!)
//}
//
//solution()
