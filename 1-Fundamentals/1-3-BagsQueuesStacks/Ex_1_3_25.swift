//
//  Ex_1_3_25.swift
//  Fundamental
//
//  Created by coze on 2018/10/31.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension List {
    func insertAfter(index: Node<T>?, node: Node<T>?) {
        guard node != nil, index != nil else {
            return
        }
        if last === index {
            last = node
        }
        node?.next = index?.next
        index?.next = node
        count += 1
    }
    
    class func testInsertAfter() {
        let a = [2, 6, 10, 8, 12]
        let lst = List<Int>.init(array: a)
        List<Int>.showList(lst)
        
        print("insertAfter(node(\(1)), null):");
        lst.insertAfter(index: lst[1], node: nil);
        List<Int>.showList(lst)
        
        var ia = 1
        var b = 3;
        print("insertAfter(node(\(ia)), createNode(\(b))):");
        lst.insertAfter(index: lst[ia], node: lst.createNode(item: b));
        List<Int>.showList(lst)
        
        ia = 5
        b = 25
        print("insertAfter(node(\(ia)), createNode(\(b))):");
        lst.insertAfter(index: lst[ia], node: lst.createNode(item: b));
        List<Int>.showList(lst)
    }
}
