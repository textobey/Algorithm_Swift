import Foundation

// [width, height]
func solution(_ sizes: [[Int]]) -> Int {
    let widths = sizes.map { $0[0] }
    let heights = sizes.map { $0[1] }
    
    let maxLength: (length: Int, position: String) = (max(widths.max()!, heights.max()!), widths.max()! > heights.max()! ? "W" : "H")
    
    if maxLength.position == "W" {
        // width가 가장 길면 width 기준으로 내림차순으로 정렬해줌
        let reversed = sizes.map { $0.sorted(by: >) }
        // 정렬했으니까 정렬된값 중 가장 큰 height하고 maxLength하고 곱해줌
        return reversed.map { $0[1] }.max()! * maxLength.length
    }
    else {
        let reversed = sizes.map { $0.sorted(by: <) }
        return reversed.map { $0[0] }.max()! * maxLength.length
    }
}

solution([[60, 50], [30, 70], [60, 30], [80, 40]]) // 4000
solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]) // 120
