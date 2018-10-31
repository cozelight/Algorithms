//
//  Exercise 1.3.19.swift
//  Fundamental
//
//  Created by coze on 2018/10/31.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension List {
    func removeLast() -> T? {
        guard !isEmpty, let node = last else {
            return nil
        }
        if first === last {
            return removeFirst()
        }
        let item = node.item
        
        var prev: Node<T>?
        var curr = first
        while curr?.next != nil {
            prev = curr
            curr = curr?.next
        }
        prev?.next = nil
        last = prev
        count -= 1
        
        return item
    }
    
    class func testRemoveLast() {
        let lst = List<Int>.init(array: [6, 8, 10, 12])
        List<Int>.showList(lst)
        
        while !lst.isEmpty {
            print("removeLast: \(String(describing: lst.removeLast()))")
            List<Int>.showList(lst)
        }
    }
}

