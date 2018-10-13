//
//  Ex_1_1_09.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_09 {
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        
        var N = 0
        if let value = Int(args[0]) {
            N = value
        }
        
        print(Int.toBinaryString(N))
    }
}

extension Int {
    static func toBinaryString(_ num: Int) -> String {
        guard num != 0 else {
            return "0"
        }
        var n = num
        var result = ""
        while n > 0 {
            result = String(n % 2) + result
            n /= 2
        }
        return result
    }
}
