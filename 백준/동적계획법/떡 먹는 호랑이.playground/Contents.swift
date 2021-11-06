import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let day: Int = input[0]//6
    let riceCake: Int = input[1]//41
    
    // 2개의 피보나치 수열을 만들거임
    var a: [Int] = [Int](repeating: 0, count: 34)
    var b: [Int] = [Int](repeating: 0, count: 34)
    
    // 근데 B는 A에 비해서 한칸씩 밀린 피보나치 수열임.
    a[0] = 1
    b[1] = 1
    
    // 피보나치 수열 만들어주는중..
    for i in 2 ..< 34 {
        a[i] = a[i - 1] + a[i - 2]
        b[i] = b[i - 1] + b[i - 2]
    }
    
    /*
    print(a)
    print(a[day - 1])
    print(b[day - 1])
    */
    
    // fiboN을 구하는 방법은 (fiboN - 1) + (fiboN - 2)인데..
    // 예를 들어 6일째에 41개의 떡을 줬으니까, 4/5일째 떡을 구하기 위해서..
    let fiboA: Int = a[day - 1]
    //               아까 b는 a에 비해 한칸씩 밀렸음(a=4, b=5)
    let fiboB: Int = b[day - 1]
    
    for i in 1 ..< 1000001 {
        // i가 1개부터 시작해서 1000000개까지 돌면서 부합하는 떡 개수를 찾아가야함
        
        // 예를 들어 6일에 -2일, 4일차에 몇개(i)의 떡을주면 될까?
        // 4일차에 준 떡을 빼고, fiboB로 나눠지면? -> 부합함
        if ((riceCake - fiboA * i) % fiboB) == 0 {
            print(i)
            print((riceCake - fiboA * i) / fiboB)
            break
        }
    }
}

solution()
