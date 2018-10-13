//
//  Ex_1_1_19.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_19 {
    class func unitTest(_ args: String...) {
        for N in 0..<94 {
            print("\(N) \(fibonacci(N))")
        }
        print("mx \(UInt64.max)")
    }
    
    class func fibonacci(_ n: Int) -> UInt64 {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        var result = Array<UInt64>.init(repeating: 0, count: n+1)
        result[1] = 1
        for i in 2...n {
            result[i] = result[i-1] + result[i-2]
        }
        return result[n]
    }
}
