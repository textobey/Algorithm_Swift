import Foundation

func solution() {
    let n: Int = 5
    var drinks: [Double] = [3, 2, 10, 9 ,6]
    
    // 음료수를 가장 적게 흘려야하기 때문에, 가장 큰 음료수에 음료수를 부어줌
    drinks.sort(by: <)
    var total: Double = Double(drinks.max()!)
    
    for i in 0 ..< (drinks.count - 1) {
        total += Double(drinks[i] / 2)
    }
    
    print(total)
}

solution()
