//
//  Ex_1_3_09.swift
//  Fundamental
//
//  Created by coze on 2018/10/22.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

/*
 1 + 2 ) * 3 - 4 ) * 5 - 6 ) ) )
 ( ( 1 + 2 ) * ( ( 3 - 4 ) * ( 5 - 6 ) ) )
 
 sqrt 1 + 2 ) )
 ( sqrt ( 1 + 2 ) )
 **/
class Ex_1_3_09 {
    @discardableResult
    class func unitTest(_ args: String...) -> String? {
        guard args.count >= 1 else {
            return nil;
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
                let op = ops.pop() ?? ""
                var v = vals.pop() ?? ""
                
                switch op {
                case "+", "-", "*", "/":
                    let v2 = vals.pop() ?? ""
                    v = "( " + v2 + " " + op + " " + v + " )"
                case "sqrt":
                    v = "( " + op + " " + v + " )"
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
        
        return vals.peek()
    }
}
