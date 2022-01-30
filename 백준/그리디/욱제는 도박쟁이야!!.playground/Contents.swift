import Foundation

func solution() {
    let n = 6
    let firstGame = [5, -2, -7, -8, 9, 1]
    let secondGame = [-9, 1, 8, -7, 5, 2]
    
    var result = 0
    
    for coin in firstGame {
        if coin < 0 {
            result += (coin * -1)
        } else {
            result += coin
        }
    }
    // 양끝의 두개의 동전 혹은 한개의 동전만을 뒤집을 수 있기 때문에
    // 결국 원하는대로 동전의 부호를 만들수가있음.
    for coin in secondGame {
        if coin > 0 {
            result -= (coin * -1)
        } else {
            result -= coin
        }
    }
    print(result)
}

solution()
