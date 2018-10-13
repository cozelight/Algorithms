//
//  Ex_1_1_15.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_15 {
    class func unitTest(_ args: String...) {
        
        let a = [1, 1, 2, 3, 1, 7, 5, 3, 2, 2, 2]
        let result = histogram(a, 8)
        print(result)
        
    }
    
    class func histogram(_ a: [Int], _ M: Int) -> [Int] {
        var h = Array<Int>.init(repeating: 0, count: M)
        let N = a.count
        
        for i in 0..<N {
            if a[i] < M {
                h[a[i]] += 1
            }
        }
        
        return h
    }
}
