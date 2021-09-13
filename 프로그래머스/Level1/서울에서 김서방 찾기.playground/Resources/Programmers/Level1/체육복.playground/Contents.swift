import UIKit

/*
 난이도: Level 1
 
 [문제설명]
 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어,
 바로 앞학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다.
 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.
 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때,
 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.

 [제한사항]
 전체 학생의 수는 2명 이상 30명 이하입니다.
 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.
 
 [입출력 예]
 예제 #1
 1번 학생이 2번 학생에게 체육복을 빌려주고, 3번 학생이나 5번 학생이 4번 학생에게 체육복을 빌려주면 학생 5명이 체육수업을 들을 수 있습니다.
 예제 #2
 3번 학생이 2번 학생이나 4번 학생에게 체육복을 빌려주면 학생 4명이 체육수업을 들을 수 있습니다.
 
 n    lost    reserve    return
 5    [2, 4]    [1, 3, 5]    5
 5    [2, 4]    [3]    4
 3    [3]    [1]    2
*/

// n: 전체학생의 수, lost: 체육복을 도난당한 학생의 번호가 담긴 배열, reserve: 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 -> 체육수업을 들을 수 있는 학생의 최대수
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    /// reserve와 lost의 차집합을 구함(각 배열안에 중복되는 값이 없어야 이슈가 없음)
    /// 여벌의 옷이 있던 학생도 도난을 당했을 수 있기 때문에, lost와 비교하여 차집합을 구해줌
    let reserveSet: Set<Int> = Set(reserve).subtracting(lost)
    var lostSet: Set<Int> = Set(lost).subtracting(reserve)
    
    for reserve in reserveSet {
        /// 여벌의 옷을 가지고 있는 학생이 뒷번호 학생에게 빌려줄수있는지 확인함
        if lostSet.contains(reserve - 1) {
            /// 빌려줄수있다면, 잃어버린 학생 목록에서 지워줌
            lostSet.remove(reserve - 1)
            continue
        }
        /// 여벌의 옷을 가지고 있는 학생이 뒷번호 학생에게 빌려줄수있는지 확인함
        else if lostSet.contains(reserve + 1) {
            lostSet.remove(reserve + 1)
        }
    }
    /// 총학생수 - 잃어버린 학생수
    return n - lostSet.count
}

solution(5, [2, 4], [1, 3, 5])
solution(5, [2, 4], [3])
solution(3, [3], [1])

func functionalSolution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let reserveSet: Set<Int> = Set(reserve).subtracting(lost)
    let lostSet: Set<Int> = Set(lost).subtracting(reserve)
    // 앞사람에게 빌려주는게 가능한 번호
    let front = reserveSet.filter { value in
        lostSet.contains(value - 1)
    }
    // 뒷사람에게 빌려주는게 가능한 번호
    let back = reserveSet.filter { value in
        lostSet.contains(value + 1)
    }
    // 중복 번호
    let overlapped = front.intersection(back)
    
    // 체육복을 빌려줄수있는 인원수
    let available = (front.count + back.count) - overlapped.count
    // 빌려줄수있는 인원수가 잃어버린 인원수보다 많으면 ? 모두 인원 체육수업 가능 : 모든인원수 - (불가능한 인원수 - 빌려줄수있는 인원수)
    return available >= lostSet.count ? n : n - (lostSet.count - available)
}

functionalSolution(5, [2, 4], [1, 3, 5]) // 5
functionalSolution(5, [2, 4], [3]) // 4
functionalSolution(3, [3], [1]) // 2
functionalSolution(20, [3, 6, 8, 10, 12, 20, 35], [5, 6, 7, 8, 9, 10, 11, 22, 36]) // 18
