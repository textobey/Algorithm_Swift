import Foundation

func solution() {
    let toppingCount = 3
    
    let doughPrice = 12
    let toppingPrice = 2
    
    let doughKcal = 200
    var toppingKcals = [50, 300, 100]
    
    toppingKcals.sort(by: <)
    
    var result = 0
    
    // 1. 도우와 모든 토핑을 넣고 1칼로리당 가격을 구함 -> 도우와 칼로리가 가장 낮은 토핑을 제외하고 1칼로리당 가격을 구함(반복)
    // 2. 1의 과정을 통해 얻은 1칼로리당 가격보다 높은지 확인함
    for _ in 0 ... toppingCount {
        // 3 * 2
        let allToppingPrice = Double(toppingKcals.count * toppingPrice)
        // 200 + 50 + 100 + 300
        let allToppingKcal = Double(doughKcal + toppingKcals.reduce(0, +))
        // 12 + 6
        let allOptionPizzaPrice = Double(doughPrice) + allToppingPrice
        
        // 650 / 18 = 36.111111....
        // 0 < 36.111111....
        if result < Int(allToppingKcal / allOptionPizzaPrice) {
            result = Int(allToppingKcal / allOptionPizzaPrice)
        }
        
        // 칼로리가 가장 낮은 토핑부터 삭제
        if !(toppingKcals.isEmpty) {
            toppingKcals.removeFirst()
        }
    }
    
    print(result)
}

solution()

//let dough1KcalPrice = doughKcal / doughPrice
//var topping1KcalPrices = toppingKcals.map { $0 / toppingPrice }
//
//if dough1KcalPrice > topping1KcalPrices.max()! {
//    print(dough1KcalPrice)
//    return
//}
//
//var result1KcalPrice = doughPrice
//var resultKcal = doughKcal
//
//
//for i in 0 ..< topping1KcalPrices.count {
//    if dough1KcalPrice < topping1KcalPrices[i] {
//        result1KcalPrice += toppingPrice
//        resultKcal += toppingKcals[i]
//    }
//}
