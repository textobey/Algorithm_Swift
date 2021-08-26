import UIKit

/*

 난이도: Level1
 
 [문제 설명]
 개발자가 사용하는 언어와 언어 선호도를 입력하면 그에 맞는 직업군을 추천해주는 알고리즘을 개발하려고 합니다.
 
 아래 표는 5개 직업군 별로 많이 사용하는 5개 언어에 직업군 언어 점수를 부여한 표입니다.
 
 점수    SI    CONTENTS    HARDWARE    PORTAL    GAME
 5    JAVA    JAVASCRIPT    C    JAVA    C++
 4    JAVASCRIPT    JAVA    C++    JAVASCRIPT    C#
 3    SQL    PYTHON    PYTHON    PYTHON    JAVASCRIPT
 2    PYTHON    SQL    JAVA    KOTLIN    C
 1    C#    C++    JAVASCRIPT    PHP    JAVA
 예를 들면, SQL의 SI 직업군 언어 점수는 3점이지만 CONTENTS 직업군 언어 점수는 2점입니다. SQL의 HARDWARE, PORTAL, GAME 직업군 언어 점수는 0점입니다.
 
 직업군 언어 점수를 정리한 문자열 배열 table, 개발자가 사용하는 언어를 담은 문자열 배열 languages, 언어 선호도를 담은 정수 배열 preference가 매개변수로 주어집니다. 개발자가 사용하는 언어의 언어 선호도 x 직업군 언어 점수의 총합이 가장 높은 직업군을 return 하도록 solution 함수를 완성해주세요. 총합이 같은 직업군이 여러 개일 경우, 이름이 사전 순으로 가장 빠른 직업군을 return 해주세요.
 
 [입출력 예]
 table    languages    preference    result
 ["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"]    ["PYTHON", "C++", "SQL"]    [7, 5, 5]    "HARDWARE"
 */

/*
 parameter
    table : 직업군 언어 점수를 정리한 배열
    languages : 개발자가 사용하는 언어를 담은 배열
    preference : 언어 선호도를 담은 정수 배열
 
 return
    ! 총합이 같은 직업군이 여러개일경우, 이름이 사전순으로 가장 빠른 직업군
    (개발자의 언어 선호도 x 직업군 언어 점수) + (개발자의 언어 선호 x 직업군 언어 점수) ...
 */
func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var category: [String] = []
    var dic: [String:[String]] = [:]
    var sDic: [String: Int] = [:]
    
    for i in 0 ..< table.count {
        let a: [String] = table[i].components(separatedBy: " ")
        category.append(a.first!)
        dic.updateValue(Array(a.dropFirst()).reversed(), forKey: a.first!)
    }
    
    for (_, value) in category.enumerated() {
        var score: Int = 0
        for i in 0 ..< dic[value]!.count {
            for j in 0 ..< languages.count {
                if dic[value]![i] == languages[j] {
                    score += (i + 1) * preference[j]
                }
            }
            sDic.updateValue(score, forKey: value)
        }
    }
    var maxArray: [String] = []
    for (_, value) in sDic.enumerated() {
        if value.value >= sDic.values.max()! {
            maxArray.append(value.key)
        }
    }
    print(maxArray.sorted(by: <).first!)
    return maxArray.sorted(by: <).first!
}

solution(["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"], ["PYTHON", "C++", "SQL"], [7, 5, 5]) // HARDWARE

solution(["SI JAVA JAVASCRIPT SQL PYTHON C#",
          "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++",
          "HARDWARE C C++ PYTHON JAVA JAVASCRIPT",
          "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP",
          "GAME C++ C# JAVASCRIPT C JAVA"],
         ["JAVA", "JAVASCRIPT"],
         [7, 5])

//점수    SI      CONTENTS    HARDWARE     PORTAL     GAME
//1    C#          C++       JAVASCRIPT    PHP       JAVA
//2    PYTHON      SQL        JAVA        KOTLIN       C
//3    SQL        PYTHON      PYHON       PYTHON   JAVASCRIPT
//4    JAVASCRIPT JAVA         C++      JAVASCRIPT     C#
//5    JAVA     JAVASCRIPT      C         JAVA         C++
