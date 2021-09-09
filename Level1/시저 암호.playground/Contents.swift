import UIKit

/*
 문제 설명

 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 "AB"는 1만큼 밀면 "BC"가 되고, 3만큼 밀면 "DE"가 됩니다. "z"는 1만큼 밀면 "a"가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.
 제한 조건
 공백은 아무리 밀어도 공백입니다.
 s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
 s의 길이는 8000이하입니다.
 n은 1 이상, 25이하인 자연수입니다.
 입출력 예
 s    n    result
 "AB"    1    "BC"
 "z"    1    "a"
 "a B z"    4    "e F d"
*/

func solution(_ s: String, _ n: Int) -> String {
    let array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let indexes = Array(s).filter { $0.isLetter }.map { array.firstIndex(of: String($0.uppercased()))! }.map { Int($0) }

    let temp = indexes.map { ($0 + n) % array.count }.map { array[$0] }
    var result: String = ""
    
    var i : Int = 0
    for j in 0 ..< s.count {
        guard Array(s)[j].isLetter else {
            result.append(" ")
            continue
        }
        result.append(Array(s)[j].isLowercase ? temp[i].lowercased() : temp[i])
        i += 1
    }
    
    return result
}

solution("AB", 1)
solution("z", 1)
solution("a B z", 4)

func anothersSolution(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)
        switch code {
        case 65...90:
            code = (code + n - 65) % 26 + 65
        case 97...122:
            code = (code + n - 97) % 26 + 97
        default:
            break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}

