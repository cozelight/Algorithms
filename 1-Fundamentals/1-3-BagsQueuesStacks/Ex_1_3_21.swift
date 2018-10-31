//
//  Ex_1_3_21.swift
//  Fundamental
//
//  Created by coze on 2018/10/31.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension List {
    // Renamed from find() to contains()
    func contains(key: T) -> Bool {
        var curr = first
        while curr != nil, curr?.item != key {
            curr = curr?.next
        }
        return curr != nil
    }
    
    class func testContains() {
        let a = [2, 4, 6, 10, 8, 12]
        let lst = List<Int>.init(array: a)
        List<Int>.showList(lst)
        
        for i in 0..<a.count {
            print("contains(\(i)): \(String(describing: lst.contains(key: i)))")
        }
    }
}
