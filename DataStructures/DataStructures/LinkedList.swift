//
//  LinkedList.swift
//  
//
//  Created by 이서준 on 2023/09/06.
//

import Foundation

class LinkedList<T: Equatable> {
    private var head: Node<T>?

    func append(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var currentNode = head
        
        // currentNode를 next로 옮겨가며, 마지막 노드의 위치를 체크하는 과정
        // 마지막 노드는 다음 노드가 nil이니까, 이를 이용하여 마지막 노드의 위치를 체크할수있다.
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(data: data)
    }
    
    func insert(data: T?, at index: Int) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var currentNode = head
        
        for _ in 0 ..< (index - 1) {
            if currentNode?.next == nil {
                break
            }
            currentNode = currentNode?.next
        }
        let currentNextNode = currentNode?.next
        currentNode?.next = Node(data: data)
        currentNode?.next?.next = currentNextNode
    }
    
    func removeLast() {
        if head == nil {
            return
        }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var currentNode = head
        
        // currentNode.next?.next를 체크하는 이유는?
        // 노드를 사용한 LinkedList의 특징을 생각해보자.
        // 마지막 노드를 지우기 위해서는 마지막 노드를 nil로 변경하는 것이 아니라, 마지막 노드를 연결하고 있는 노드의 next를 nil로 변경하는것이다.
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = nil
    }
    
    func remove(at index: Int) {
        if head == nil {
            return
        }
        
        var currentNode = head
        
        for _ in 0 ..< (index - 1) {
            if currentNode?.next?.next == nil {
                break
            }
            currentNode = currentNode?.next
        }
        // insertAt과 달리 노드를 끊어주고 맺어줄 필요없이, 끊어주기만 하면된다.
        currentNode?.next = currentNode?.next?.next
    }
    
    func searchNode(from data: T) -> Node<T>? {
        if head == nil {
            return nil
        }
        
        var currentNode = head
        
        while currentNode?.next != nil {
            if currentNode?.data == data {
                break
            }
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
