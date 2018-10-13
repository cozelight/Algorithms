//
//  Ex_1_1_03.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_03 {
    class func unitTest(_ args: String...) {
        guard args.count >= 3 else {
            print("not equal")
            return;
        }
        let a = Int(args[0])
        let b = Int(args[1])
        let c = Int(args[2])
        
        if a == b && a == c {
            print("equal")
        } else {
            print("not equal")
        }
        
    }
}
