import UIKit

func solution() {
    let n: Int = 4 //Int(readLine()!)!
    let price: [Int] = "3 5 15 16".split(separator: " ").map { Int($0)! }
    //readLine()!.split(separator: " ").map { Int($0)! }
    
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    
    /*
     n을 4라고 가정하고 진행
     1. 카드를 한팩 뽑을 경우.. "3" -> 3이 최대값 -> dp[1]에 저장 [0, 3, 0, 0, 0]
     2. 카드를 두팩 뽑을 경우.. "3 5" -> max(3+3, 5) (경우가 2가지임!) -> dp[2]에 저장 [0, 3, 6, 0, 0]
        2-2. 'max(3+3, 5)' 부분을 max(price[0] + price[0], price[1]))로 생각하는것이 아니라,
              max(dp[2 - 1] + price[0], dp[2 - 2] + price[1])로 생각하는것.
              점화식 : dp[n] = max(dp[n - 1] + Pi)
     3. 카드를 세팩 뽑을 경우.. "3 5 16"
        3-2. max(dp[3 - 1] + price[0],
                 dp[3 - 2] + price[1],
                 dp[3 - 3] + price[2])
     
     정리 : price[i]번째에서 카드팩을 뽑았을 경우, 뽑을수있는 남은 카드팩 숫자는 n - i임.
           -> 남은 카드팩 숫자로 뽑아낼수있는 최대치 + price[i]
     */
    
    for i in 1 ..< dp.count {
        for j in 1 ... i {
            //          dp[i]-> 같은 i번째에서 max값이 바뀌는것을 방지
            dp[i] = max(dp[i], dp[i - 1], dp[i - j] + price[j - 1])
        }
    }
    
    print(dp.max()!)
}

solution()
