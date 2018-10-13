//
//  Ex_1_1_24.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_24 {
    class func unitTest(_ args: String...) {
        print("result: \(euclid(105, 24))")
        print("result: \(euclid(1111111, 1234567))")
    }
    
    class func euclid(_ p: Int, _ q: Int) -> Int {
        print("p: \(p), q: \(q)")
        if q == 0 {
            return p
        } else {
            return euclid(q, p % q)
        }
    }
}
