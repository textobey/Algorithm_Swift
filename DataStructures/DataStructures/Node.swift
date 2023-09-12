//
//  Node.swift
//  DataStructures
//
//  Created by 이서준 on 2023/09/06.
//

import Foundation

class Node<T> {
    var prev: Node?
    var data: T?
    var next: Node?
    
    init(prev: Node? = nil, data: T?, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data) -> " + String(describing: next) + " "
    }
}
