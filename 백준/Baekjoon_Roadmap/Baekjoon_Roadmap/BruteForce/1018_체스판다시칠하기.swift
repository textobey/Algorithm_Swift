//
//  1018_체스판다시칠하기.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/08.
//

import Foundation

// 1018_체스판 다시 칠하기

// 내가 생각한 아이디어.(틀림)
// 가로줄에서 연이은 8개, 세로줄에서 연이은 8개를
// 0번째 인덱스부터 늘려가며,
// 각 라인에 Black 4, White 4개가 맞는지 확인
// 숫자가 안맞는다면 도합 몇개가 안맞는지 total에 더해나감
// 모든 8/8 인덱스를 돌렸을때, 제일 낮은 total 값을 출력

// 참조한 코드의 아이디어.
// 내가 고려하지 못한것은 4,4개가 있는지 확인하는 것인데
// BBBBWWWW인 경우 올바른 체스판이 아니지만 조건이 통과됨(반례)
// 올바른 White 색상 체스판 1개, Black 색상 체스판 1개를 만들고
// 똑같이 0번째 인덱스부터 늘려가며,
// 모든 8/8 인덱스를 돌렸을때, 제일 낮은 total 값을 출력

func solution() {
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let height: Int = input[0]
    let width: Int = input[1]
    
//    let inputBoard: [String] = [
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBB",
//        "BBBBBBBBBBBBBBBBBBBBBBW"
//    ]
    
    var splitedBoard: [[String]] = []
    
    //for i in 0 ..< inputBoard.count {
    //    splitedBoard.append(inputBoard[i].map { String($0) })
    //}
    
    for _ in 0 ..< height {
        let line = readLine()!
        splitedBoard.append(Array(line).map { String($0) })
    }
    
    let whiteBoard: [[String]] = [
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"]
    ]

    let blackBoard: [[String]] = [
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"],
        ["B","W","B","W","B","W","B","W"],
        ["W","B","W","B","W","B","W","B"]
    ]
    
    var result: Int = Int.max
    
    for y in 0 ... (height - 8) {
        for x in 0 ... (width - 8) {
            
            var diffInWhiteBoardCount: Int = 0
            var diffInBlackBoardCount: Int = 0
            
            for i in y ..< (y + 8) {
                for j in x ..< (x + 8) {
//                    print("y", y)
//                    print("x", x)
//                    print("i", i)
//                    print("j", j)
                    if splitedBoard[i][j] != whiteBoard[i - y][j - x] {
                        diffInWhiteBoardCount += 1
                    }

                    if splitedBoard[i][j] != blackBoard[i - y][j - x] {
                        diffInBlackBoardCount += 1
                    }
                }
            }
            
            result = min(result, diffInWhiteBoardCount, diffInBlackBoardCount)
        }
    }
    
    print(result)
}

solution()
