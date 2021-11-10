import Foundation

func solution(_ s: String) -> [Int] {
    var answer: [Int] = [Int]()
    // }를 기준으로 나누고 -> 남은 {도 replacingOccurrences으로 모두 제거 -> ,를 기준으로 [[String.Element]]로 만들어줌
    let tuples = s.split(separator: "}")
        .map { $0.replacingOccurrences(of: "{", with: "") }
        .map { $0.split(separator: ",") }
    
    // 빠른 처리를 위해 튜플이 한개인 경우는 바로 리턴
    if tuples.count <= 1 {
        return tuples.first.map { $0.map { Int(String($0))! } }!
    }
    
    // 조금만 들여다보면 패턴이 보이는데, $0.count가 1인 튜플이 가장 처음 튜플임
    // count를 기준으로 오름차순 정렬해주고..
    let sortedOfTuples = tuples.sorted { $0.count < $1.count }
    
    for i in 0 ..< sortedOfTuples.count {
        for j in 0 ..< sortedOfTuples[i].count {
            // 이중배열 돌면서 정렬된 array를 차곡차곡 넣어줌.
            let element = Int(String(sortedOfTuples[i][j]))!
            // 중복요소가 들어가면 안되니까 포함되지 않는 내용만
            if answer.contains(element) != true {
                answer.append(element)
            }
        }
    }
    
    // 소스 길이나 퍼포먼스 좀더 손볼수 있을거 같은데.. 귀찮다.
    return answer
}

func anothersSolution(_ s: String) -> [Int] {
    var result: [Int] = []

    // omittingEmptySubsequences: 빈 시퀀스의 경우 생략함
    var sets = s.split(omittingEmptySubsequences: true, whereSeparator: { "}".contains($0) }).map {
        $0.split(omittingEmptySubsequences: true, whereSeparator: { "{,".contains($0) }).map { Int($0)! }
    }

    sets.sort { (lhs, rhs) -> Bool in
        lhs.count < rhs.count
    }


    sets.forEach {
        result.append(Array(Set($0).subtracting(result)).first!)
    }

    return result
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}") //[2,1,3,4]
solution("{{1,2,3},{2,1},{1,2,4,3},{2}}") //[2,1,3,4]
solution("{{20,111},{111}}") //[111,20]
solution("{{123}}") //[123]
solution("{{4,2,3},{3},{2,3,4,1},{2,3}}") //[3,2,4,1]
