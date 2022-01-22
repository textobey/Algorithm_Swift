import Foundation

func solution() {
    let a = 64//88
    let b = 120//17
    
    let frequencys: [Int] = [1, 567] //[18, 1, 42]
    
    let closeFrequency = frequencys.map { frequency -> (Int, Int) in
        // return 절대값(b - 고정된 주파수), 고정된 주파수
        let temp = abs(b - frequency)
        return (temp, frequency)
    }
    // 절대값(b - 고정된 주파수)가 가장 작은값 == 이동이 제일 덜 필요한값
    let min = closeFrequency.sorted { $0.0 < $1.0 }.first!
    // 그냥 깡으로 a에서b로 이동 vs 위의 min값중, 작은값
    return print([abs(b - a), abs(b - min.1) + min.0].min()!)
}

solution()
