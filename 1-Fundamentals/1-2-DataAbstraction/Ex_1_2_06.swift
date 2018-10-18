//
//  Ex_1_2_06.swift
//  Fundamental
//
//  Created by coze on 2018/10/18.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_2_06 {
    class func unitTest(_ args: String...) {
        
        let s = "ACTGACG"
        let t = "TGACGAC"
        
        print("s: " + s)
        print("t: " + t)
        
        let result = isCircularRotation(s, t)
        
        print("result: \(result)")
    }
    
    class func isCircularRotation(_ s: String, _ t: String) -> Bool {
        var tmp = s
        tmp.append(s)
        return tmp.contains(t)
    }
}
