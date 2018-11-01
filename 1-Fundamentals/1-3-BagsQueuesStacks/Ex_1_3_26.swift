//
//  Ex_1_3_26.swift
//  Fundamental
//
//  Created by coze on 2018/11/1.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension List {
    func remove(key: T) {
        var prev: Node<T>?
        var curr = first
        while curr != nil {
            if let item = curr?.item, item == key {
                if prev == nil {
                    first = first?.next
                } else {
                    prev?.next = curr?.next
                }
                if curr?.next == nil {
                    last = prev
                }
                count -= 1
            } else {
                prev = curr
            }
            curr = curr?.next
        }
    }
    
    func remove2(key: T) {
        let idx = List<Int>.init()
        var i = 1
        for item in self {
            if item == key {
                idx.prepend(i)
            }
            i += 1
        }
        
        for k in idx {
            delete(k: k)
        }
    }
    
    class func testRemove() {
        for _ in 0..<8 {
            let lst = List<Int>.randomList(n: 20, a: 0, b: 5)
            List<Int>.showList(lst)
            
            let key = Int(arc4random_uniform(5))
            print("remove(\(key))")
            
            lst.remove(key: key)
            List<Int>.showList(lst)
        }
    }
}
