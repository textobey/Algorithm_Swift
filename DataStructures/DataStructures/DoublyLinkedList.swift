//
//  DoublyLinkedList.swift
//  DataStructures
//
//  Created by 이서준 on 2023/09/07.
//

import Foundation

class DoublyLinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func append(data: T?) {
        if head == nil || tail == nil {
            head = Node(data: data)
            tail = head
            return
        }
        
        let newNode = Node(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    func insert(data: T?) {
        if head == nil || tail == nil {
            head = Node(data: data)
            tail = head
            return
        }
        
        let newNode = Node(data: data)
        newNode.next = head
        head?.prev = newNode
        head = newNode
    }
    
    func removeLast() {
        if head == nil || tail == nil {
            return
        }
        
        // 노드가 1개뿐인 경우
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = nil
        tail = tail?.prev
    }
    
    func searchNode(from data: T) -> Node<T>? {
        if head == nil || tail == nil {
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
    
    func searchNodeFromTail(from data: T) -> Node<T>? {
        if head == nil || tail == nil {
            return nil
        }
        
        var currentNode = tail
        
        while currentNode?.prev != nil {
            if currentNode?.data == data {
                break
            }
            currentNode = currentNode?.prev
        }
        
        return currentNode
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
