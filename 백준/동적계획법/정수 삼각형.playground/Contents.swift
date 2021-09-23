import UIKit

func solution() {
    let n: Int = 5
    var array = [[Int]]()
    for _ in 0 ..< n {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        array.append(nums)
    }
    
    for i in 1 ..< n {
        // j의 배열크기는 i보다 1크니까 i + 1
        for j in 0 ..< i + 1 {
            // 맨 왼쪽, 인덱스가 0일 경우
            if j == 0 {
                array[i][j] += array[i - 1][j]
            }
            // 맨 오른쪽, 인덱스가 last일 경우
            else if i == j {
                array[i][j] += array[i - 1][j - 1]
            }
            // 맨 왼쪽과 오른쪽 사이에 존재하는 index일 경우
            else {
                // 왼쪽위 오른쪽위중에 큰값
                array[i][j] += max(array[i - 1][j], array[i - 1][j - 1])
            }
        }
    }
    print(array.last!.max()!)
}

solution()
