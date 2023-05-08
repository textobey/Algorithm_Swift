import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
    // 직접 그려가며 패턴을 찾고 있었는데..
    // "넓이 - min(width, height) = 멀쩡한 사각형 개수" 라는 패턴을 찾았다.
    // 근데, 정답인 문제도 있었으나 틀린 문제도 있었다.. 아무리 고민해도 찾지 못해서 풀이를 찾아봤다.
    if w <= 1 || h <= 1 {
        return 0
    }
    // 꼭지점 구하기? 라는 수학문제를 이용한것으로 보이는데..관련 수학 공식이 있는듯하다.
    // 그렇기에 최대 공약수를 선행해야한다.
    return Int64((w * h) - ((w + h) - gcd(w, h)))
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

solution(8, 12) //80
