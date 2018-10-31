//
//  Node.swift
//  Fundamental
//
//  Created by coze on 2018/9/29.
//  Copyright © 2018 cozelight. All rights reserved.
//

class Node<T: Equatable> {
    var item: T?
    var next: Node?
    
    convenience init(_ node: Node<T>) {
        self.init()
        item = node.item
        while node.next != nil {
            next = Node.init(node.next!)
        }
    }
}
