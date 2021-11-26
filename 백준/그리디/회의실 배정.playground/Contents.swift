import UIKit

func solution() {
    let n: Int = 11
    let time: [(start: Int, end: Int, duration: Int)] = [
        "1 4",
        "3 5",
        "0 6",
        "5 7",
        "3 8",
        "5 9",
        "6 10",
        "8 11",
        "8 12",
        "2 13",
        "12 14"
    ].map { timeOfString -> (Int, Int, Int) in
        let split = timeOfString.split(separator: " ")
        let start = Int(split[0])!; let end = Int(split[1])!
        return (start, end, end - start)
    }

    // 일찍 끝나는 회의를 기준으로 잡아서 정렬하면 최대 회의 수를 구할 수 있음
    let sorted = time.sorted {
        if $0.end == $1.end {
            // 종료 시간이 같다면 시작 시간이 빠른순
            return $0.start < $1.start
        } else {
            // 종료 시간이 다르다면 종료 시간이 빠른순
            return $0.end < $0.end
        }
    }
    
    var count: Int = 0; var dp: Int = 0
    
    for i in 0 ..< sorted.count {
        // 저장된 회의 종료 시점이, 다음 회의 시작시간보다 작거나 같으면
        if dp <= sorted[i].start {
            // 해당 회의의 종료 시점 저장
            dp = sorted[i].end
            count += 1
        }
    }
    
    print(count)
}

solution()
// (1,4), (5,7), (8,11), (12,14)


