//
//  ResizingArrayStack.swift
//  Fundamental
//
//  Created by coze on 2018/9/29.
//  Copyright © 2018 cozelight. All rights reserved.
//

class ResizingArrayStack<T> {
    
    private var array = ContiguousArray<T>()
    
    convenience init(stack: ResizingArrayStack<T>) {
        self.init()
        array.append(contentsOf: stack.array)
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func push(_ element: T) {
        array.append(element)
    }
    
    @discardableResult
    func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
}

extension ResizingArrayStack: Sequence {
    func makeIterator() -> AnyIterator<T> {
        let curr = ResizingArrayStack<T>.init(stack: self)
        return AnyIterator {
            return curr.pop()
        }
    }
}

extension ResizingArrayStack {
    class func unitTest() {
        let text = "to be or not to - be - - that - - - is"
        let list = text.split(separator: " ")
        let stack = ResizingArrayStack<String>.init()
        for item in list {
            if item != "-" {
                stack.push(String(item))
            } else if (!stack.isEmpty) {
                print(stack.pop() ?? "", separator: "", terminator: " ")
            }
        }
        
        print("")
        
        print("Left on stack:", terminator: "")
        
        for item in stack {
            print(" " + item, terminator: "")
        }
        
        print("")
        
        print("Counts: \(stack.count)")
    }
}
