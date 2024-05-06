//
//  PriorityQueue.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/06.
//

import Foundation

// Abstract Data Type(추상적 자료구조 ADT)
//
// 우선순위 큐(Priority Queue)
// 큐와 유사하지만, 우선순위가 높은 아이템이 먼저 처리되는 특징이 있다.
//
// 주요동작 3가지
// insert(우선순위 정보도 같이 넣어줘야함)
// delete: 우선순위가 가장 높은 아이템을 빼냄(삭제)
// peek: delete와 같지만, 우선순위 큐에서 삭제하지는 않음
//

struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
        heap = Heap(elements: elements, sortFuntions: sort)
    }
    
    var count: Int {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    func top() -> T? {
        return heap.peek
    }
    
    mutating func clear() {
        while !heap.isEmpty {
            _ = heap.remove()
        }
    }
    
    mutating func push(_ element: T) {
        heap.insert(node: element)
    }
    
    mutating func pop() -> T? {
        return heap.remove()
    }
}
