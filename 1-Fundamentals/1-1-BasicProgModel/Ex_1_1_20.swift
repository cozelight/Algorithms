//
//  Ex_1_1_20.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_20 {
    class func unitTest(_ args: String...) {
       print(ln(10))
    }
    
    class func ln(_ n: Int) -> Double {
        if n <= 1 {
            return 0
        }
        return log(Double(n)) + ln(n - 1)
    }
}
