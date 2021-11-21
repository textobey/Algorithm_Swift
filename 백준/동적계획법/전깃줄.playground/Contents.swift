import Foundation

func solution() {
    let n: Int = Int(readLine()!)! //8
    var wires: [(Int, Int)] = [] /*= [
        (1, 8),
        (3, 9),
        (2, 2),
        (4, 1),
        (6, 4),
        (10, 10),
        (9, 7),
        (7, 6)
    ]*/
    
    var dp: [Int] = [Int](repeating: 1, count: n)
    for _ in 0 ..< n {
        let num = readLine()!.split(separator: " ").map { Int($0)! }
        wires.append((num[0], num[1]))
        //wires[0].append(num[0]); wires[1].append(num[1])
    }
    //print(wires[0].max()! - (n - 1))
    //dp[0] = 0
    
    //if n == 1 {
    //    print(0)
    //    return
    //}
    
    // 서로 전깃줄로 연결된, 전봇대 A의 번호에 따라 오름차순으로 정렬하게 되었을때,
    // 나열된 전봇대 B의 '부분 증가 수열의 최대 길이' == 최대 연결가능한 전깃줄 수가 된다.
    let sortedWires = wires.sorted { a, b -> Bool in
        a.0 < b.0
    }
    
    for i in 1 ..< n {
        for j in 0 ..< i {
            // 정렬된 B의 전깃줄 i가 j보다 크다면, 부분 증가 수열의 최대 길이를 구하기 위해 비교하며 dp에 저장.
            if sortedWires[i].1 > sortedWires[j].1 {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(n - dp.max()!)
}

solution()
