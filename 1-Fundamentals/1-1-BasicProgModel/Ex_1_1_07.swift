//
//  Ex_1_1_07.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_07 {
    class func unitTestA(_ args: String...) {
        var t = 9.0
        var count = 0
        
        while abs(t - 9.0 / t) > 0.001 {
            t = (9.0 / t + t) / 2.0
            count += 1
        }
        let format = String(format: "%.5f", t)
        print(format)
    }
    class func unitTestB(_ args: String...) {
        var sum = 0
        for i in 1..<1000 {
            for _ in 0..<i {
                sum += 1
            }
        }
        print(sum)
    }
    class func unitTestC(_ args: String...) {
        var sum = 0
        var i = 1;
        while i < 1000 {
            for _ in 0..<1000 {
                sum += 1
            }
            i *= 2
        }
        print(sum)
    }
}
