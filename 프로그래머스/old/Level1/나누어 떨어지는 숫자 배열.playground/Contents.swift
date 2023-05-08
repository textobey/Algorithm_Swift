import UIKit

/*
 난이도: Level1

[문제 설명]
array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.
 
[제한사항]
arr은 자연수를 담은 배열입니다.
정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
divisor는 자연수입니다.
array는 길이 1 이상인 배열입니다.
 
[입출력 예]
arr    divisor    return
[5, 9, 7, 10]    5    [5, 10]
[2, 36, 1, 3]    1    [1, 2, 3, 36]
[3,2,6]    10    [-1]

[입출력 예 설명]
입출력 예#1
arr의 원소 중 5로 나누어 떨어지는 원소는 5와 10입니다. 따라서 [5, 10]을 리턴합니다.
입출력 예#2
arr의 모든 원소는 1으로 나누어 떨어집니다. 원소를 오름차순으로 정렬해 [1, 2, 3, 36]을 리턴합니다.
입출력 예#3
3, 2, 6은 10으로 나누어 떨어지지 않습니다. 나누어 떨어지는 원소가 없으므로 [-1]을 리턴합니다.
*/

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var temp: [Int] = []
    for i in 0 ..< arr.count {
        if arr[i] % divisor == 0 {
            temp.append(arr[i])
        }
    }
    if temp.count <= 0 {
        temp.append(-1)
    }
    // sort: 오름차순 정렬
    temp.sort()
    
    // sort(by: >) 내림차순 정렬
    // temp.sort(by: >)
    
    // sorted() 오름차순 정렬된 배열 반환
    // let a = temp.sorted()
    
    print(temp)
    return temp
}

//solution([5, 9, 7, 10], 5)
//solution([2, 36, 1, 3], 1)
//solution([3, 2, 6], 10)

func functionalProgramming(_ arr:[Int], _ divisor:Int) -> [Int] {
    let log: (AnyHashable) -> () = { print($0) }
    let filtered = arr.filter { $0 % divisor == 0 }
    let temp: [Int] = filtered.count <= 0 ? [-1] : filtered.sorted()
    
    log(temp)
    return temp
}

functionalProgramming([5, 9, 7, 10], 5)
functionalProgramming([2, 36, 1, 3], 1)
functionalProgramming([3, 2, 6], 10)
