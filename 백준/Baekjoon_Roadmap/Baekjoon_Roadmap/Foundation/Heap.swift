//
//  Heap.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/05/06.
//

import Foundation

// 완전 이진 트리 기반으로 구현 되는 Heap
// 트리: 부모-자녀처럼 계층적인 형태를 가지는 구조
// 이진트리: 자녀가 최대 2개인 트리
//
// max heap: 부모 노드의 키(key)가 자식 노드(들)의 키(key)보다 크거나 같다.
// min heap: 부모 노드의 키(key)가 자식 노드(들)의 키(key)보다 작거나 같다.
//
// 힙 주요 동작 3가지
// insert: key를 포함하여 아이템을 넣음
// delete: heap 종류에 따라 가장 크거나 낮은 아이템을 꺼냄(삭제)
// peek: delete와 동일하지만 heap에서 아이템을 삭제하지 않음
//
// 우선순위 큐와 항상 따라붙는 자료 구조
// 왜 why?
// Heap의 key를 우선순위(Priority)로 사용한다면
// Heap은 우선순위 큐(Priority Queue)의 구현체가 되기 떄문에
//
// 엄밀히 따지자면, Heap을 사용하여 우선순위 큐를 구현했을때
// 제일 효율이 좋기 때문에, Heap으로 구현하는 것이고 (우선순위 큐 != 힙)

// Comparable: 대소 비교가 가능한 데이터가 만족하는 프로토콜
struct Heap<T: Comparable> {
    private var elements: [T] = []
    
    // 오름차순 정렬이면 최소힙이 되고, 내림차순 정렬이면 최대힙이 된다.
    private let sortFuntions: (T, T) -> Bool
    
    var isEmpty: Bool {
        // 1번째 인덱스를 nil로 채우기 때문에, 1은 isEmpty와 같음
        return self.elements.count == 1
    }
    
    var peek: T? {
        if self.isEmpty {
            return nil
        }
        return self.elements[1]
    }
    
    var count: Int {
        return self.elements.count - 1
    }
    
    init(
        elements: [T] = [],
        sortFuntions: @escaping (T, T) -> Bool
    ) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFuntions = sortFuntions
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func parent(of index: Int) -> Int {
        return index / 2
    }
    
    mutating func insert(node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
            return
        }
        self.elements.append(node)
        self.swimUp(from: elements.endIndex - 1)
    }
    
    mutating func swimUp(from index: Int) {
        var index = index
        
        // 루트 노드에 도착하거나, 현재 노드와 부모 노드를 정렬 조건을 비교하여 스왑해줌
        while index != 1 && sortFuntions(elements[index], elements[parent(of: index)]) {
            elements.swapAt(index, parent(of: index))
            index = self.parent(of: index)
        }
    }
    
    mutating func remove() -> T? {
        if elements.isEmpty {
            return nil
        }
        elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        return deleted
    }
    
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = leftChild(of: index)
        let rightIndex = rightChild(of: index)
        
        // 마지막 위치의 노드까지만 수행 && 왼쪽 자식 노드가 더 우선순위가 높을때
        if leftIndex < elements.endIndex && sortFuntions(elements[leftIndex], elements[higherPriority]) {
            higherPriority = leftIndex
        }
        
        // 마지막 위치의 노드까지만 수행 && 오른쪽 자식 노드가 더 우선순위가 높을때
        if rightIndex < elements.endIndex && sortFuntions(elements[rightIndex], elements[higherPriority]) {
            higherPriority = rightIndex
        }
        
        // 교환이 필요한 경우는 교환 후 서브트리로 이동
        if higherPriority != index {
            elements.swapAt(higherPriority, index)
            diveDown(from: higherPriority)
        }
    }
    
    // 생성자로 받은 배열을 heap으로 재구성하기 위한 메서드
    // 마지막 리프노드의 부모노드부터 루트노트까지 서브트리의 루트노드들을 순회하면서 diveDown
    mutating func buildHeap() {
        for index in (1 ... (elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
}
