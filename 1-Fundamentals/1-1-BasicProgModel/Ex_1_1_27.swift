//
//  Ex_1_1_27.swift
//  Fundamental
//
//  Created by coze on 2018/10/14.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_27 {
    
    class func unitTest(_ args: String...) {
        print(binomial(100, 50, 0.25))
    }
    
    class func binomial(_ n: Int, _ k: Int, _ p: Double) -> Double {
        var v = [[Double]](repeating: [Double](repeating: 0, count: k+1), count: n+1)
        for i in 0...n {
            v[i][0] = pow(1.0-p, Double(i))
        }
        v[0][0] = 1.0
        for i in 1...n {
            for j in 1...k {
                v[i][j] = p * v[i-1][j-1] + (1.0 - p) * v[i-1][j]
            }
        }
        return v[n][k]
    }
    
}
