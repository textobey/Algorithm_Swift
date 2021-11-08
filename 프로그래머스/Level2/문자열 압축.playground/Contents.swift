import Foundation

func solution(_ s:String) -> Int {
    // 문자열 길이가 1이면 아래 로직을 수행할 필요도 없음.
    if s.count == 1 {
        return 1
    }
    // String s를 배열로 만들어줌
    let arrayOfs = Array(s)
    // 가장 짧은 길이
    var minLength: Int = s.count
    
    for i in 1 ... arrayOfs.count / 2 {
        var equalCount: Int = 1
        var result: String = ""
        
        var preStr = arrayOfs[0 ..< i].reduce("") { "\($0)" + "\($1)"}
        var indiceStr = ""
        
        // i씩 증가하면서 반복,(* to: 미포함(..<), through: 포함(...))
        for j in stride(from: 0, to: arrayOfs.count, by: i) {
            // index out range 고려해서 -1
            if (j + i) > arrayOfs.count - 1 {
                indiceStr = arrayOfs[j ..< arrayOfs.count].reduce("") { "\($0)" + "\($1)"}
                //print(
                //    preStr,
                //    arrayOfs[j ..< arrayOfs.count].reduce("") { "\($0)" + "\($1)"}
                //)
            } else {
                indiceStr = arrayOfs[j ..< j + i].reduce("") { "\($0)" + "\($1)"}
                //print(
                //    preStr,
                //    arrayOfs[j ..< j + i].reduce("") { "\($0)" + "\($1)"}
                //)
            }
            
            if preStr == indiceStr {
                // 이전 문자열과 인덱스를 통해 가져온 문자열이 서로 같음
                equalCount += 1
            } else {
                if equalCount == 1 {
                    // 반복되는 문자열이 존재하지 않음
                    result += preStr
                } else {
                    // 반복된 수와 문자를 전달
                    result += "\(equalCount)\(preStr)"
                }
                // 초기화
                equalCount = 1
            }
            // 비교가 끝났으니 현재 문자열을 이전 문자열에 전달해주고 다시 반복,
            preStr = indiceStr
        }
        if equalCount == 1 {
            result += preStr
        } else {
            result += "\(equalCount)\(preStr)"
        }
        
        // 저장된 또는 저장되고 있었던 길이보다 짧은 문자열이 나타나면 교체
        if minLength > result.count {
            minLength = result.count
        }
    }
    
    return minLength
}

solution("aabbaccc") // 7
solution("ababcdcdababcdcd") // 9
solution("abcabcdede") // 8
