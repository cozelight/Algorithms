//
//  Ex_1_3_24.swift
//  Fundamental
//
//  Created by coze on 2018/10/31.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension List {
    func removeAfter(node: Node<T>?) {
        guard node?.next != nil else {
            return
        }
        if node?.next?.next == nil {
            last = node
        }
        node?.next = node?.next?.next
        count -= 1
    }
    
    class func testRemoveAfter() {
        let a = [2, 6, 10, 8, 12]
        let lst = List<Int>.init(array: a)
        List<Int>.showList(lst)
        
        let k = [0, 2, 1, 5, 3, 2, 1]
        for i in 0..<k.count {
            let key = k[i]
            print("removeAfter(node(\(key))")
            lst.removeAfter(node: lst[key])
            List<Int>.showList(lst)
        }
    }
}
