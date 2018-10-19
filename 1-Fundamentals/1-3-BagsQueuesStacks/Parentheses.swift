//
//  Parentheses.swift
//  Fundamental
//
//  Created by coze on 2018/10/19.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

struct Parentheses {
    static let LEFT_PAREN: Character = "("
    static let RIGHT_PAREN: Character  = ")"
    static let LEFT_BRACE: Character  = "{"
    static let RIGHT_BRACE: Character  = "}"
    static let LEFT_BRACKET: Character  = "["
    static let RIGHT_BRACKET: Character  = "]"
    
    static func isBalanced(_ s: String) -> Bool {
        let stack = Stack<Character>.init()
        for item in s {
            if item == LEFT_PAREN
                || item == LEFT_BRACE
                || item == LEFT_BRACKET {
                stack.push(item)
            }
            if item == RIGHT_PAREN {
                if stack.isEmpty {
                    return false
                }
                if stack.pop() != LEFT_PAREN {
                    return false
                }
            } else if item == RIGHT_BRACE {
                if stack.isEmpty {
                    return false
                }
                if stack.pop() != LEFT_BRACE {
                    return false
                }
            } else if item == RIGHT_BRACKET {
                if stack.isEmpty {
                    return false
                }
                if stack.pop() != LEFT_BRACKET {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

extension Parentheses {
    static func unitTest(_ args: String...) {
        guard args.count > 0 else {
            return
        }
        // [()]{}{[()()]()} : true
        // [(]) : false
        let s = args[0]
        print(s + " : \(isBalanced(s))")
    }
}
