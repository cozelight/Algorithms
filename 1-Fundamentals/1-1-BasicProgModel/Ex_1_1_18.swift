//
//  Ex_1_1_18.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_18 {
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        
        var a = 0
        if let value = Int(args[0]) {
            a = value
        }
        
        var b = 0
        if let value = Int(args[1]) {
            b = value
        }
        
        print(mystery(2, 25))
        print(mystery(3, 11))
        print(mystery(a, b) == a * b)
        
        print(mystery2(2, 25))
        print(mystery2(3, 11))
        let result = pow(Decimal(a), b)
        print(Decimal(mystery2(a, b)).isEqual(to: result))
        
    }
    
    class func mystery(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return 0
        }
        if b % 2 == 0 {
            return mystery(a + a, b / 2)
        }
        return mystery(a + a, b / 2) + a
    }
    
    class func mystery2(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return 1
        }
        if b % 2 == 0 {
            return mystery2(a * a, b / 2)
        }
        return mystery2(a * a, b / 2) * a
    }
}
