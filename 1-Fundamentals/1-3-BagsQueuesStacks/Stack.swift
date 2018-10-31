//
//  Stack.swift
//  Fundamental
//
//  Created by coze on 2018/9/29.
//  Copyright © 2018 cozelight. All rights reserved.
//

class Stack<T: Equatable> {
    
    private var first: Node<T>?
    var count = 0
    
    var isEmpty: Bool {
        return first == nil
    }
    
    convenience init(stack: Stack<T>) {
        self.init()
        var temp = stack.first
        while temp != nil {
            self.push((temp?.item)!)
            temp = temp?.next
        }
    }
    
    func push(_ item: T) {
        let oldFirst = first
        first = Node()
        first?.item = item
        first?.next = oldFirst
        count += 1
    }
    
    @discardableResult
    func pop() -> T? {
        guard !isEmpty, let node = first else {
            return nil
        }
        let item = node.item
        first = node.next
        count -= 1
        return item
    }
    
    func peek() -> T? {
        guard !isEmpty, let node = first else {
            return nil
        }
        return node.item
    }
}

extension Stack: Sequence {
    func makeIterator() -> AnyIterator<T> {
        let curr = Stack<T>.init(stack: self)
        return AnyIterator {
            return curr.pop()
        }
    }
}

extension Stack {
    class func unitTest() {
        let text = "to be or not to - be - - that - - - is"
        let list = text.split(separator: " ")
        let stack = Stack<String>.init()
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

