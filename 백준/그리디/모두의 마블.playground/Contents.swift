import Foundation

func solution() {
    let n = 3
    var cards: [Int] = [40, 30, 30]
    
    var maxIndex = 0
    var max = 0
    var sum = 0
    
    for i in 0 ..< cards.count {
        if cards[i] > max {
            maxIndex = i
            max = cards[i]
        }
    }
    
    // 위에서 가장 큰 카드를 고르고, 제외해놓음
    cards.remove(at: maxIndex)
    
    // 나머지 카드 전부 더해주기
    for card in cards {
        sum += card
    }
    
    // sum += 아까 빼놓은 가장 큰 카드 * 나머지 카드의 수
    sum += max * (n - 1)
    
    print(sum)
}

solution()
