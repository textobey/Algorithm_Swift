import UIKit

/*
 난이도: Level1
 
 [문제 설명]
 2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 두 수 a ,b를 입력받아 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요. 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT

 입니다. 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 "TUE"를 반환하세요.

 제한 조건
 2016년은 윤년입니다.
 2016년 a월 b일은 실제로 있는 날입니다. (13월 26일이나 2월 45일같은 날짜는 주어지지 않습니다)
 입출력 예
 a    b    result
 5    24    "TUE"
 */

func solution(_ a:Int, _ b:Int) -> String {
    var array: [String] = ["FRI","SAT"]
    var calendar: [Int: [String]] = [:]

    for i in 1 ... a {
        var days: [String] = []
        for _ in 1 ... getMonthLastDay(i) {
            days.append(array.first!)
            array.removeFirst()
            if array.count <= 0 {
                array = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
            }
        }
        calendar[i] = days
    }
    
    return calendar.sorted { $0.key < $1.key }.filter { $0.key == a }.map { $0.value[b - 1] }.first!
}

func getMonthLastDay(_ mon: Int) -> Int {
    guard mon != 2 else { return 29 }
    return mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8 || mon == 10 || mon == 12 ? 31 : 30
}

//solution(5, 24)
solution(12, 31)

func anothersSolution(_ a: Int, _ b: Int) -> String {
    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDay = monthDay[0..<a-1].reduce(0, +) + b

    return w[totalDay % 7]
}

anothersSolution(5, 24)
