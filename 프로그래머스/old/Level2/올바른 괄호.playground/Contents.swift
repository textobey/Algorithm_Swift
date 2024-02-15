import UIKit

func solution(_ s: String) -> Bool {
    var stack: [Character] = []
    
    for ch in s {
        if ch == "(" {
            stack.append(ch)
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty
}

/*
 
 replacingOccurrences의 시간복잡도는 O(n)
 while문까지 있기 때문에, 시간복잡도는 O(n^2)
 코드 구현은 간단하지만, 문자열이 길어질수록 비효율적임
 
func solution(_ s: String) -> Bool {
    var ans = s
    
    while ans.contains("()"), !ans.isEmpty {
        ans = ans.replacingOccurrences(of: "()", with: "")
    }
    
    return ans.isEmpty
}
*/

solution("()()")
//solution("(())()")
//solution(")()(")
//solution("(()(")
//solution("((((()))))")
