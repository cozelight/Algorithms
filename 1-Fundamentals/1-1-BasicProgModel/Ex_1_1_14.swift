//
//  Ex_1_1_14.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_14 {
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        
        var N = 0
        if let value = Int(args[0]), value > 0 {
            N = value
        }
        
        print(lg(N)!)
    }
    
    class func lg(_ num: Int) -> Int? {
        guard num >= 0 else {
            return nil
        }
        if num == 0 {
            return Int.min
        }
        if num == 1 {
            return 0
        }
        var shiftRightCount = 0
        var n = num
        while n > 1 {
            shiftRightCount += 1
            n >>= 1
        }
        return shiftRightCount
    }
}
