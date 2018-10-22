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
    class func unitTest(_ args: String...) {
        guard args.count >= 1 else {
            return;
        }
        let text = args[0]
        let textArray = text.split(separator: " ")
        let vals = Stack<String>.init()
        let ops = Stack<String>.init()
        for item in textArray {
            if item == "+"
                || item == "-"
                || item == "*"
                || item == "/"
                || item == "sqrt"{
                ops.push(String(item))
            } else if item == ")" {
                let op = ops.pop() ?? ""
                var v = vals.pop() ?? ""
                if op == "+"
                    || op == "-"
                    || op == "*"
                    || op == "/" {
                    let v2 = vals.pop() ?? ""
                    v = "( " + v2 + " " + op + " " + v + " )"
                } else if op == "sqrt" {
                    v = "( " + op + " " + v + " )"
                }
                vals.push(v)
            } else if item == "(" {
                continue
            } else {
                vals.push(String(item))
            }
        }
        print(vals.peek()!)
    }
}
