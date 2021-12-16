import Foundation

/*
 큰 수 만들기
 난이도: Level 2
 
 문제 설명
 어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.
 예를 들어, 숫자 1924에서 수 두 개를 제거하면 [19, 12, 14, 92, 94, 24] 를 만들 수 있습니다. 이 중 가장 큰 숫자는 94 입니다.
 문자열 형식으로 숫자 number와 제거할 수의 개수 k가 solution 함수의 매개변수로 주어집니다. number에서 k 개의 수를 제거했을 때 만들 수 있는 수 중 가장 큰 숫자를 문자열 형태로 return 하도록 solution 함수를 완성하세요.
 
 제한 조건
 number는 1자리 이상, 1,000,000자리 이하인 숫자입니다.
 k는 1 이상 number의 자릿수 미만인 자연수입니다.
 
 */

func solution(_ number: String, _ k: Int) -> String {
    var stack: [Int] = [Int]()
    var count: Int = 0
    
    let arrayOfNum = number.map { Int(String($0))! }
    
    for i in 0 ..< arrayOfNum.count {
        // 1. stack에 숫자가 존재함
        // 2. 추가된 마지막 숫자가 추가 되려는 숫자보다 작을 때
        // 3. 지워야 되는 수가 남았을 때
        while stack.count > 0 && stack.last! < arrayOfNum[i] && count < k  {
            stack.removeLast()
            count += 1
            if count == k {
                break
            }
        }
        stack.append(arrayOfNum[i])
    }
    
    // 12번 반례 고려(("77777",1), ("777711111",1))
    if count == 0 {
        (1 ... k).forEach { _ in
            stack.removeLast()
        }
    }
    
    return stack.map { String($0) }.joined()
}

solution("1924", 2)
solution("1231234", 3)
solution("4177252841", 4)
