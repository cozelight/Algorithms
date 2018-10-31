//
//  Ex_1_3_20.swift
//  Fundamental
//
//  Created by coze on 2018/10/31.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension List {
    func delete(k: Int) -> T? {
        guard k > 0 else {
            return nil
        }
        var index = 1
        var prev: Node<T>?
        var curr = first
        while index < k && curr != nil {
            prev = curr
            curr = curr?.next
            index += 1
        }
        if curr == nil {
            return nil
        }
        if prev == nil {
            first = curr?.next
        } else {
            prev?.next = curr?.next
        }
        if curr?.next == nil {
            last = prev
        }
        count -= 1
        return curr?.item
    }
    
    class func testDelete() {
        let lst = List<Int>.init(array: [2, 4, 6, 8, 10, 12])
        List<Int>.showList(lst)
        
        print("delete(\(5)): \(String(describing: lst.delete(k: 5)))")
        List<Int>.showList(lst)
        
        print("delete(\(1)): \(String(describing: lst.delete(k: 1)))")
        List<Int>.showList(lst)
        
        print("delete(\(4)): \(String(describing: lst.delete(k: 4)))")
        List<Int>.showList(lst)
        
        print("delete(\(8)): \(String(describing: lst.delete(k: 8)))")
        List<Int>.showList(lst)
        
        print("delete(\(0)): \(String(describing: lst.delete(k: 0)))")
        List<Int>.showList(lst)
        
        while !lst.isEmpty {
            print("delete(\(1)): \(String(describing: lst.delete(k: 1)))")
            List<Int>.showList(lst)
        }
    }
}

