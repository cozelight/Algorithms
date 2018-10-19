//
//  ResizingArrayQueue.swift
//  Fundamental
//
//  Created by coze on 2018/9/5.
//  Copyright © 2018年 cozelight. All rights reserved.
//

class ResizingArrayQueue<T> {
    
    private var array = ContiguousArray<T?>()
    private var head = 0
    
    convenience init(queue: ResizingArrayQueue<T>) {
        self.init()
        array.append(contentsOf: queue.array)
        head = queue.head
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return array.count - head
    }
    
    func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        guard head < array.count, let element = array[head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    func peek() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

extension ResizingArrayQueue: Sequence {
    func makeIterator() -> AnyIterator<T> {
        let curr = ResizingArrayQueue<T>.init(queue: self)
        return AnyIterator {
            return curr.dequeue()
        }
    }
}

extension ResizingArrayQueue {
    class func unitTest() {
        let text = "to be or not to - be - - that - - - is"
        let list = text.split(separator: " ")
        let queue = ResizingArrayQueue<String>.init()
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
