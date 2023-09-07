//
//  Stack.swift
//  DataStructures
//
//  Created by 이서준 on 2023/09/07.
//

import Foundation

class Stack<T: Equatable> {
    
    private var stack = LinkedList<T>()
    
    func push(data: T) {
        stack.insert(data: data, at: 0)
    }
    
    func pop() {
        stack.remove(at: 0)
    }
    
    func peek() -> Node<T>? {
        return stack.getNode(at: 0)
    }
    
    func isEmpty() -> Bool {
        return true
    }
}
