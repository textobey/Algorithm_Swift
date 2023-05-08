import Foundation

func solution(_ s: String) -> Int{
    var arrayOfs: [String.Element] = [String.Element]()
    
    for c in s {
        // 배열에 문자가 존재하는데, 마지막 문자가 c와 같다면 마지막 문자를 제거함(2개를 지우는 효과/ 생각의 전환)
        if arrayOfs.count > 0, arrayOfs.last == c {
            arrayOfs.removeLast()
        }
        else {
            arrayOfs.append(c)
        }
    }
    
    return arrayOfs.count == 0 ? 1 : 0
}

solution("baabaa")
solution("cdcd")
