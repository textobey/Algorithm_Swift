import UIKit

//func solution(start: String, end: String, nowHour: Int, nowMinute: Int) {
//    let arrayOfStart = Array(start).map { String($0) }
//    let sHour = Int(arrayOfStart[0 ... 1].joined())!
//    let sMinute = Int(arrayOfStart[2 ... 3].joined())!
//
//    let arrayOfEnd = Array(end).map { String($0) }
//    let eHour = Int(arrayOfEnd[0 ... 1].joined())!
//    let eMinute = Int(arrayOfEnd[2 ... 3].joined())!
//
//    let sleepHour: [Int] = Array(min(sHour, eHour) ... max(sHour, eHour))
//    let sleepMinute: [Int] = Array(min(sMinute, eMinute) ... max(sMinute, eMinute))
//
//    var isSleepHour = false
//    var isSleepMinute = false
//
//    //if sHour > eHour {
//        print(sleepHour)
//    //    isSleepHour = (sleepHour.contains(nowHour) ? false : true)
//    //} else {
//        isSleepHour = (sleepHour.contains(nowHour) ? true : false)
//    //}
//
//
//    //if sMinute > eMinute {
//    //    print(sleepMinute)
//    //    isSleepMinute = (sleepMinute.contains(nowMinute) ? false : true)
//    //} else {
//    //    print(sleepMinute)
//    //    isSleepMinute = (sleepMinute.contains(nowMinute) ? true : false)
//    //}
//
//    print("isSleepHour:", isSleepHour, "isSleepMinute:", isSleepMinute)
//    print(isSleepHour && isSleepMinute ? "수면시간" : "수면시간아님")
//}

func solution(start: String, end: String, now: String) {
    let start = change0to24(num: Int(start)!)
    let end = change0to24(num: Int(end)!)
    let now = change0to24(num: Int(now)!)
    
    let allTime: [Int] = Array(100 ... 2459)
    let sleepTime: [Int] = Array(min(start, end) ... max(start, end))
    
    if start == now || end == now {
        print("수면시간")
    } else if start < end {
        let result = Set(allTime).intersection(sleepTime).firstIndex(of: now) == nil
        print(result ? "수면시간X1" : "수면시간O1" )
    } else {
        let result = Set(allTime).subtracting(sleepTime).firstIndex(of: now) == nil
        print(result ? "수면시간X2" : "수면시간O2" )
    }
}

func change0to24(num: Int) -> Int {
    return num < 100 ? num + 2400 : num
}

solution(start: "0750", end: "0800", now: "1635")

func solution(start: String, end: String, now: String) {
    
}


//solution(start: "1630", end: "0820", nowHour: 13, nowMinute: 30)
//solution(start: "1630", end: "0820", nowHour: 14, nowMinute: 30)
//solution(start: "1630", end: "0820", nowHour: 15, nowMinute: 30)
//solution(start: "1630", end: "0820", nowHour: 17, nowMinute: 30)
//solution(start: "1630", end: "0820", nowHour: 18, nowMinute: 30)


//func solution(start: Int, end: Int, hour: Int, minute: Int) {
//    let sleepHour: [Int] = Array(min(start, end) ... max(start, end))
//    let sleepMinute: [Int] = Array(0 ... 59)
//
//    if start > end {
//        sleepHour.contains(hour) ? print("수면시간아님") : print("수면시간")
//    } else {
//        sleepHour.contains(hour) ? print("수면시간") : print("수면시간아님")
//    }
//
//
////    var sleepTimes = Set(hours).subtracting(sleep).sorted(by: <)
////
////    sleepTimes.append(start)
////    sleepTimes.append(end)
////
////    if sleepTimes.contains(now) {
////        print("수면시간")
////    } else {
////        print("수면시간아님")
////    }
//}
