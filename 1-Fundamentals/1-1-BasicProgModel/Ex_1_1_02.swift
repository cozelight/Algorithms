//
//  Ex_1_1_02.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_02 {
    class func unitTest() {
        let a = (1 + 2.236) / 2
        let b = 1 + 2 + 3 + 4.0
        let c = 4.1 >= 4
        let d = String(1 + 2) + "3"
        
        print("value = \(a), type = \(type(of: a))")
        print("value = \(b), type = \(type(of: b))")
        print("value = \(c), type = \(type(of: c))")
        print("value = \(d), type = \(type(of: d))")
    }
}
