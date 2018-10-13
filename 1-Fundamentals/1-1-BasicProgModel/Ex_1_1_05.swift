//
//  Ex_1_1_05.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_05 {
    class func unitTest(_ args: String...) {
        guard args.count >= 2 else {
            print(false)
            return;
        }
        
        var x = 0.0
        if let xValue = Double(args[0]) {
            x = xValue
        }
        
        var y = 0.0
        if let yValue = Double(args[1]) {
            y = yValue
        }
        
        print(x > 0 && x < 1 && y > 0 && y < 1)
        
    }
}
