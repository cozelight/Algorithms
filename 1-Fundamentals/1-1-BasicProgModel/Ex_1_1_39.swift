//
//  Ex_1_1_39.swift
//  Fundamental
//
//  Created by coze on 2018/10/14.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_39 {
    
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        
        var t = 0
        if let value = Int(args[0]), value > 0 {
            t = value
        }
        
        print("T: \(t)")
        
        let ns = [1000, 10000, 100000, 1000000]
        
        for i in 0..<ns.count {
            batch(t, ns[i])
        }
        
        /*
         T: 10
         1000:      1.50
         10000:    112.40
         100000:  10510.50
         1000000: 670573.80
         */
    }
    
    class func experiment(_ n: Int) -> Int {
        var a = Array.init(repeating: 0, count: n)
        var b = Array.init(repeating: 0, count: n)
        
        for i in 0..<n {
            a[i] = Int(arc4random_uniform(900000)) + 100000
            b[i] = Int(arc4random_uniform(900000)) + 100000
        }
        
        b = b.sorted()
        
        var count = 0
        for i in 0..<n {
            if Ex_1_1_29.indexOf(a[i], b) != -1 {
                count += 1
            }
        }
        
        return count
    }
    
    class func batch(_ t: Int, _ n: Int) {
        var count = 0
        for _ in 0..<t {
            count += experiment(n)
        }
        let avg = Double(count) / Double(t)
        let format = String(format: "%d: %9.2f", n, avg)
        print(format)
    }
}
