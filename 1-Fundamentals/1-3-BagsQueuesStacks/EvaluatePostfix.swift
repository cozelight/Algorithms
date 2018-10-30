//
//  EvaluatePostfix.swift
//  Fundamental
//
//  Created by coze on 2018/10/26.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

/*
 *  % EvaluatePostfix.unitTest("1 2 3 + 4 5 * * +")
 *  101.0
 *
 *  % EvaluatePostfix.unitTest("1 5 sqrt + 2.0 /")
 *  1.618033988749895
 *
 *  % EvaluatePostfix.unitTest(InfixToPostfix.unitTest("( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )")!)
 *  ( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )
 *  101.0
 *
 *  % EvaluatePostfix.unitTest(InfixToPostfix.unitTest("( ( 1 + sqrt ( 5 ) ) / 2.0 )")!)
 *  ( ( 1 + sqrt ( 5 ) ) / 2.0 )
 *  1.618033988749895
 **/
class EvaluatePostfix {
    @discardableResult
    class func unitTest(_ args: String...) -> Double? {
        guard args.count >= 1 else {
            return nil;
        }
        
        let text = args[0]
        let textArray = text.split(separator: " ")
        
        let vals = Stack<Double>.init()
        
        for item in textArray {
            
            switch item {
                
            case "+":
                var v = vals.pop()!
                v = vals.pop()! + v
                vals.push(v)
                
            case "-":
                var v = vals.pop()!
                v = vals.pop()! - v
                vals.push(v)
                
            case "*":
                var v = vals.pop()!
                v = vals.pop()! * v
                vals.push(v)
                
            case "/":
                var v = vals.pop()!
                v = vals.pop()! / v
                vals.push(v)
                
            case "sqrt":
                var v = vals.pop()!
                v = sqrt(v)
                vals.push(v)
                
            case ")", "(":
                break
                
            default:
                vals.push(Double(item) ?? 0.0)
            }
            
        }
        
        print(vals.peek()!)
        
        return vals.peek()
    }
}
