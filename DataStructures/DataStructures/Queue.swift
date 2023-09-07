//
//  Queue.swift
//  DataStructures
//
//  Created by 이서준 on 2023/09/07.
//

import Foundation

// dequeue에서도 효율적인 Queue

struct Queue<T> {
    
    private var queue: [T?] = []
    private var head: Int = 0
    
    mutating func enqueue(data: T) {
        return queue.append(data)
    }
    
    // 실제 배열의 head를 삭제하는 것이 아닌, nil로 변경하고 head를 가리키고 있는 포인트만 변경시킴
    // 이로써 오버헤드가 발생하는 queue에서 좀더 효율적으로 변함
    // 그래도 배열을 계속 늘려나가기만 할수는 없기 때문에, 어느순간(ex.50개)에는 배열과 head를 초기화(삭제)해줌
    mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else {
            return nil
        }
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}


// dequeue에서 오버헤드가 발생, O(n)의 시간복잡도를 가지는 Queue

/*
struct Queue<T> {
    
    // 직접만든 LinkedList를 활용해도 되지만, Swift에서 지원하는 배열을 통해 쉽게 구현가능
    private var queue: [T] = []
    
    mutating func enqueue(data: T) {
        return queue.append(data)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty() ? nil : queue.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}
*/


