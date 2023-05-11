wimport UIKit

// 문제 설명
// 한국중학교에 다니는 학생들은 각자 정수 번호를 갖고 있습니다.
// 이 학교 학생 3명의 정수 번호를 더했을 때 0이 되면 3명의 학생은 삼총사라고 합니다.
// 예를 들어, 5명의 학생이 있고, 각각의 정수 번호가 순서대로 -2, 3, 0, 2, -5일 때,
// 첫 번째, 세 번째, 네 번째 학생의 정수 번호를 더하면 0이므로 세 학생은 삼총사입니다.
// 또한, 두 번째, 네 번째, 다섯 번째 학생의 정수 번호를 더해도 0이므로 세 학생도 삼총사입니다.
// 따라서 이 경우 한국중학교에서는 두 가지 방법으로 삼총사를 만들 수 있습니다.

// 한국중학교 학생들의 번호를 나타내는 정수 배열 number가 매개변수로 주어질 때,
// 학생들 중 삼총사를 만들 수 있는 방법의 수를 return 하도록 solution 함수를 완성하세요.

// 제한사항
// 3 ≤ number의 길이 ≤ 13
// -1,000 ≤ number의 각 원소 ≤ 1,000
// 서로 다른 학생의 정수 번호가 같을 수 있습니다.

// 입출력 예
// number    result
// [-2, 3, 0, 2, -5]    2
// [-3, -2, -1, 0, 1, 2, 3]    5
// [-1, 1, -1, 1]    0

// 입출력 예 설명
// 입출력 예 #1
// 문제 예시와 같습니다.

// 입출력 예 #2
// 학생들의 정수 번호 쌍 (-3, 0, 3), (-2, 0, 2), (-1, 0, 1), (-2, -1, 3), (-3, 1, 2) 이 삼총사가 될 수 있으므로, 5를 return 합니다.

//입출력 예 #3
//삼총사가 될 수 있는 방법이 없습니다.

func solution(_ number: [Int]) -> Int {
    
    var result = Set<String>()
    
    func dfs(_ depth: Int, _ visited: [Int]) {
        if depth == 2 {
            //print(visited)
            // visited에 더해진 number[index] 값을 모두 더함
            let sum = visited.reduce(0, { return $0 + number[$1] })
            if sum == 0 {
                // 중복 제거를 위해 정렬하고, Set 배열에 insert
                result.insert(visited.sorted().map({String($0)}).joined())
            }
            return
        }
        for i in 0 ..< number.count {
            // i번째 숫자가 이미 사용 되었다면 사용하지 않기 위해
            if !visited.contains(i) {
                // 선택된 학생 정수 count + 1, 다음 index 추가
                dfs(depth + 1, visited + [i])
            }
        }
    }
    
    for i in 0 ..< number.count {
        dfs(0, [i])
    }
    
    return result.count
}

//solution([-2, 3, 0, 2, -5])
//solution([-3, -2, -1, 0, 1, 2, 3])
//solution([-1, 1, -1, 1])

func otherSolution(_ number:[Int]) -> Int {
    var answer = 0
    
    func dfs(_ now: Int, _ sum: Int, _ count: Int) {
        if count == 3 {
            if sum == 0 { answer += 1 }
            return
        }
        for i in now ..< number.count {
            print(i)
            dfs(i + 1, sum + number[i], count + 1)
        }
    }
    
    dfs(0, 0, 0)
    return answer
}

otherSolution([-2, 3, 0, 2, -5])
//otherSolution([-3, -2, -1, 0, 1, 2, 3])
//otherSolution([-1, 1, -1, 1])


//func solution3(_ number:[Int]) -> Int {
//    var result: Int = 0
//
//    func dfs(depth: Int, head: Int, sum: Int) {
//        if depth == 3 {
//            if sum == 0 { result += 1 }
//            return
//        }
//        if head < number.count {
//            dfs(depth: depth + 1, head: head + 1, sum: sum + number[head])
//            dfs(depth: depth, head: head + 1, sum: sum)
//        }
//    }
//
//    dfs(depth: 0, head: 0, sum: 0)
//
//    return result
//}
//
//solution3([-2, 3, 0, 2, -5])
