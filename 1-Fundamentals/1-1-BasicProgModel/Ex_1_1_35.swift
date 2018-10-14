//
//  Ex_1_1_35.swift
//  Fundamental
//
//  Created by coze on 2018/10/14.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_35 {
    
    static let SIDES = 6
    
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        
        var N = 0
        if let value = Int(args[0]), value > 0 {
            N = value
        }
        
        let exact = getExact()
        print("Probability: ")
        for k in 2...2*SIDES {
            let result = String(format: "%6.3f", exact[k])
            print(result, separator: "", terminator: " ")
        }
        print("")
        
        var isAccurate = true
        
        let  experim = getExperim(N)
        print("Frequency: ")
        for k in 2...2*SIDES {
            let result = String(format: "%6.3f", experim[k])
            print(result, separator: "", terminator: " ")
            let abs = experim[k] - exact[k]
            if abs > 0.001 || abs < -0.001 {
                isAccurate = false
            }
        }
        print("")
        
        // N >= 1,000,000  (< 1 sec.)
        print("Is accurate? \(isAccurate)")
    }
    
    class func getExact() -> [Double] {
        var dist = Array.init(repeating: 0.0, count: 2 * SIDES + 1)
        
        for i in 1...SIDES {
            for j in 1...SIDES {
                dist[i + j] += 1.0
            }
        }
        
        for k in 2...2*SIDES {
            dist[k] /= Double(SIDES*SIDES)
        }
        
        return dist
    }
    
    class func getExperim(_ n: Int) -> [Double] {
        var dist = Array.init(repeating: 0.0, count: 2 * SIDES + 1)
        
        for _ in 0..<n {
            dist[throwDice()] += 1
        }
        
        for k in 2...2*SIDES {
            dist[k] /= Double(n)
        }
        
        return dist
    }
    
    class func throwDice() -> Int {
        let dice = arc4random_uniform(6) + arc4random_uniform(6) + 2
        return Int(dice)
    }
}
