//
//  Ex_1_1_06.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_06 {
    class func unitTest(_ args: String...) {
        
        var f = 0
        var g = 1
        for _ in 0...15 {
            print(f)
            f = f + g
            g = f - g
        }
        
    }
}
