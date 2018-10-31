//
//  Queue.swift
//  Fundamental
//
//  Created by coze on 2018/9/29.
//  Copyright © 2018 cozelight. All rights reserved.
//

class Queue<T: Equatable> {
    
    private var first: Node<T>?
    private var last: Node<T>?
    var count = 0
    
    var isEmpty: Bool {
        return first == nil
    }
    
    convenience init(queue: Queue<T>) {
        self.init()
        var temp = queue.first
        while temp != nil {
            self.enqueue((temp?.item)!)
            temp = temp?.next
        }
    }
    
    func enqueue(_ item: T) {
        let newNode = Node<T>()
        newNode.item = item
        if isEmpty {
            first = newNode
            last = newNode
        } else {
            last?.next = newNode
            last = newNode
        }
        count += 1
    }
    
    @discardableResult
    func dequeue() -> T? {
        guard !isEmpty, let firstNode = first else {
            return nil
        }
        let item = firstNode.item
        first = firstNode.next
        count -= 1
        if isEmpty {
            last = nil
        }
        return item
    }
    
    func peek() -> T? {
        guard !isEmpty, let firstNode = first else {
            return nil
        }
        return firstNode.item
    }
}

extension Queue: Sequence {
    func makeIterator() -> AnyIterator<T> {
        let curr = Queue<T>.init(queue: self)
        return AnyIterator {
            return curr.dequeue()
        }
    }
}

extension Queue {
    class func unitTest() {
        let text = "to be or not to - be - - that - - - is"
        let list = text.split(separator: " ")
        let queue = Queue<String>.init()
        for item in list {
            if item != "-" {
                queue.enqueue(String(item))
            } else if (!queue.isEmpty) {
                print(queue.dequeue() ?? "", separator: "", terminator: " ")
            }
        }
        print("")
        
        print("Left on queue:", terminator: "")
        
        for item in queue {
            print(" " + item, terminator: "")
        }
        
        print("")
        
        print("Counts: \(queue.count)")
    }
}
