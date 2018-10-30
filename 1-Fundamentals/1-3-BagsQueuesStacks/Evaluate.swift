//
//  Evaluate.swift
//  Fundamental
//
//  Created by coze on 2018/10/26.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

/*
 *  ( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )
 *  101.0
 *
 *  ( ( 1 + sqrt ( 5 ) ) / 2.0 )
 *  1.618033988749895
 **/
class Evaluate {
    @discardableResult
    class func unitTest(_ args: String...) -> Double? {
        guard args.count >= 1 else {
            return nil;
        }
        
        let text = args[0]
        let textArray = text.split(separator: " ")
        
        let vals = Stack<Double>.init()
        let ops = Stack<String>.init()
        
        for item in textArray {
            
            switch item {
                
            case "+", "-", "*", "/", "sqrt":
                ops.push(String(item))
                
            case ")":
                let op = ops.pop()!
                var v = vals.pop()!
                
                switch op {
                case "+":
                    v = vals.pop()! + v
                case "-":
                    v = vals.pop()! - v
                case "*":
                    v = vals.pop()! * v
                case "/":
                    v = vals.pop()! / v
                case "sqrt":
                    v = sqrt(v)
                default:
                    break
                }
                
                vals.push(v)
                
            case "(":
                break
                
            default:
                vals.push(Double(item) ?? 0.0)
            }
            
        }
        
        print(vals.peek()!)
        
        return vals.peek()
    }
}
