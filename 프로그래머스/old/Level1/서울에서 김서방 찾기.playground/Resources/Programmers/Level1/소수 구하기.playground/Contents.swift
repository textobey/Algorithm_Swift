import UIKit

/*
 난이도: Level1
 
 [문제 설명]
 주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.
 
 [제한사항]
 nums에 들어있는 숫자의 개수는 3개 이상 50개 이하입니다.
 nums의 각 원소는 1 이상 1,000 이하의 자연수이며, 중복된 숫자가 들어있지 않습니다.
 
 [입출력 예]
 nums    result
 [1,2,3,4]    1
 [1,2,7,6,4]    4
 입출력 예 설명
 입출력 예 #1
 [1,2,4]를 이용해서 7을 만들 수 있습니다.
 
 입출력 예 #2
 [1,2,4]를 이용해서 7을 만들 수 있습니다.
 [1,4,6]을 이용해서 11을 만들 수 있습니다.
 [2,4,7]을 이용해서 13을 만들 수 있습니다.
 [4,6,7]을 이용해서 17을 만들 수 있습니다.
 */

func solution(_ nums:[Int]) -> Int {
    var answer = -1
    var sums: [Int] = []
    
    for i in 0 ..< nums.count - 2 {
        for j in i + 1 ..< nums.count {
            for k in j + 1 ..< nums.count {
                sums.append(nums[i] + nums[j] + nums[k])
            }
        }
    }
    
    answer = sums.count
    
    for i in 0 ..< sums.count {
        for j in 2 ..< sums[i] - 1 {
            if sums[i] % j == 0 {
                answer -= 1
                break
            }
        }
    }
    
    print(answer)
    return answer
}

solution([1, 2, 3, 4])
// 1,2,36
// 1,2,4
// 1,3,4
// 2,3,4

solution([1, 2, 7, 6, 4])
// 1,2,3
// 1,2,4
// 1,2,5
// 1,3,4
// 1,3,5
// 1,4,5
// 2,3,4
// 2,3,5
// 2,4,5
// 3,4,5
