//
//  List.swift
//  Fundamental
//
//  Created by coze on 2018/10/30.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class List<T> {
    
    private var first: Node<T>?
    private var last: Node<T>?
    var count = 0
    
    var isEmpty: Bool {
        return first == nil
    }

    convenience init<S>(sequence: S) where S: Sequence, S.Element == T {
        self.init()
        for item in sequence {
            append(item)
        }
    }
    
    convenience init(array: [T]) {
        self.init()
        for item in array {
            append(item)
        }
    }
    
    func firstItem() -> T? {
        return first?.item
    }
    
    func lastItem() -> T? {
        return last?.item
    }
    
    func prepend(_ item: T) {
        let newNode = Node<T>()
        newNode.item = item
        if isEmpty {
            first = newNode
            last = newNode
        } else {
            newNode.next = first
            first = newNode
        }
        count += 1
    }
    
    func append(_ item: T) {
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
    
    func removeFirst() -> T? {
        guard !isEmpty, let node = first else {
            return nil
        }
        let item = node.item
        first = node.next
        count -= 1
        if isEmpty {
            last = nil
        }
        return item
    }
}

extension List: Sequence {
    func makeIterator() -> AnyIterator<T> {
        var firstNode = self.first
        return AnyIterator {
            let item = firstNode?.item
            firstNode = firstNode?.next
            return item
        }
    }
}

// MARK: Exercise 1.3.19
extension List {
    func removeLast() -> T? {
        guard !isEmpty, let node = last else {
            return nil
        }
        if first === last {
            return removeFirst()
        }
        let item = node.item
        
        var prev: Node<T>?
        var curr = first
        while curr?.next != nil {
            prev = curr
            curr = curr?.next
        }
        prev?.next = nil
        last = prev
        count -= 1
        
        return item
    }
}

// MARK: Unit test
extension List {
    class func testBaseMethods() {
        let a = [2, 4, 6, 8, 10, 12]
        var lst = List<Int>.init()
        for item in a {
            lst.append(item)
        }
        List<Int>.showList(lst)
        
        lst = List<Int>.init()
        for item in a {
            lst.prepend(item)
        }
        List<Int>.showList(lst)
        
        print("removeFirst: \(String(describing: lst.removeFirst()!))")
        List<Int>.showList(lst)
    }
    
    class func testRemoveLast() {
        let lst = List<Int>.init(array: [6, 8, 10, 12])
        List<Int>.showList(lst)
        
        while !lst.isEmpty {
            print("removeLast: \(String(describing: lst.removeLast()!))")
            List<Int>.showList(lst)
        }
    }
}

// MARK: Unit test helpers
extension List {
    class func showList(_ list: List<T>) {
        for item in list {
            print(item, terminator: " ")
        }
        print("👇")
        var str: String
        if !list.isEmpty {
            str =  "Size: \(list.count), First: \(String(describing: list.firstItem()!)), Last: \(String(describing: list.lastItem()!))"
        } else {
            str =  "Size: \(list.count)"
        }
        print(str)
    }
    
    class func randomList(n: Int, a: Int, b: Int) -> List<Int> {
        var r = [Int]()
        for _ in 0..<n {
            r.append(Int(arc4random_uniform(UInt32(b)) + UInt32(a)))
        }
        return List<Int>.init(array: r)
    }
    
    class func unitTest() {
        testBaseMethods()
        print("")
        testRemoveLast()
        print("")
    }
}
