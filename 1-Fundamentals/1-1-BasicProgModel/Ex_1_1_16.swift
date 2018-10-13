//
//  Ex_1_1_16.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_16 {
    class func unitTest(_ args: String...) {
        print(exR1(6))
    }
    
    class func exR1(_ n: Int) -> String {
        if n <= 0 {
            return "";
        }
        return exR1(n-3) + String(n) + exR1(n-2) + String(n)
    }
}
