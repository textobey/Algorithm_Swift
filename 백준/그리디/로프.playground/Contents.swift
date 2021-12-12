import Foundation

func solution() {
    let rope: Int = 2
    let withStandWeight: [Int] = [10, 15]
    
    // 공식 -> withStandWeight.min()! * rope
    // 예를들어 로프가 버틸수있는 중량이 10,15 라면
    // 15는 15이하의 중량도 버틸수있지만, 10은 11초과의 중량을 달게되면 끊어지게 된다.
    // 그렇기 때문에, (더 낮은 중량을 버틸수있는 로프 * 로프의 수)가 버틸수있는 최대 중량이 된다.
    
    var sortedWeight = withStandWeight.sorted(by: <) // 오름차순으로 정렬
    
    // 가장 큰 중량을 버틸수있는 로프부터, 가장 작은 중량을 버틸수있는 로프 순으로
    for i in (0 ..< sortedWeight.count).reversed() {
        // 1번째로 큰 로프 하나가 버틸수있는 중량 * 로프 1개
        // 2번째로 큰 로프 * 로프 2개
        // 3번째로 큰 로프 * 로프 3개
        // ...
        // 위의 과정을 통해 가장 큰 무게를 버틸수있는 무게를 구한다.
        sortedWeight[i] = sortedWeight[i] * (rope - i)
    }
    print(sortedWeight.max()!)
}

solution()
