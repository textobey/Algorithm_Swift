import UIKit

// 문제 설명
// 비밀지도
// 네오는 평소 프로도가 비상금을 숨겨놓는 장소를 알려줄 비밀지도를 손에 넣었다.
// 그런데 이 비밀지도는 숫자로 암호화되어 있어 위치를 확인하기 위해서는 암호를 해독해야 한다.
// 다행히 지도 암호를 해독할 방법을 적어놓은 메모도 함께 발견했다.

// 지도는 한 변의 길이가 n인 정사각형 배열 형태로, 각 칸은 "공백"(" ") 또는 "벽"("#") 두 종류로 이루어져 있다.
// 전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 "지도 1"과 "지도 2"라고 하자.
// 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다. 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다.

// ..중략
// 링크: https://school.programmers.co.kr/learn/courses/30/lessons/17681

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var maps: [[String]] = Array(repeating: Array(repeating: "", count: n), count: n)
    
    let clue1 = arr1.map { addPadding(radix: String($0, radix: 2), n: n).map { Int(String($0))! } }
    let clue2 = arr2.map { addPadding(radix: String($0, radix: 2), n: n).map { Int(String($0))! } }
    
    for i in 0 ..< maps.count {
        for j in 0 ..< maps.count {
            maps[i][j] = clue1[i][j] + clue2[i][j] > 0 ? "#" : " "
        }
    }
    
    return maps.map { $0.joined() }
}

func addPadding(radix: String, n: Int) -> String {
    if radix.count < n {
        return String(repeating: "0", count: n - radix.count) + radix
    }
    return radix
}

solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
solution(6, [46, 33, 33, 22, 31, 50], [27, 56, 19, 14, 14, 10])
