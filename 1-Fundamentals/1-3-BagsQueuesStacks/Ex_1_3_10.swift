//
//  Ex_1_3_10.swift
//  Fundamental
//
//  Created by coze on 2018/10/26.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

/*
 ( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )
 1 2 3 + 4 5 * * +
 
 ( sqrt ( 1 + 2 ) )
 1 2 + sqrt
 **/
class InfixToPostfix {
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        
        let text = args[0]
        let textArray = text.split(separator: " ")
        
        let vals = Stack<String>.init()
        let ops = Stack<String>.init()
        
        for item in textArray {
            
            switch item {
                
            case "+", "-", "*", "/", "sqrt":
                ops.push(String(item))

            case ")":
                let op = ops.pop()!
                var v = vals.pop()!
                
                switch op {
                case "+", "-", "*", "/":
                    v = vals.pop()! + " " + v + " " + op
                case "sqrt":
                    v = v + " " + op
                default:
                    break
                }
                
                vals.push(v)
                
            case "(":
                break
                
            default:
                vals.push(String(item))
            }
        }
        
        print(vals.peek()!)
    }
}
