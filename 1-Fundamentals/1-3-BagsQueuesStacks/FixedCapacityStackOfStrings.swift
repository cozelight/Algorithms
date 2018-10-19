//
//  FixedCapacityStackOfStrings.swift
//  Fundamental
//
//  Created by coze on 2018/10/19.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class FixedCapacityStackOfStrings {
    private var items: [String?]
    private var count = 0
    
    init(capacity: Int) {
        items = Array<String?>.init(repeating: nil, count: capacity)
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func isFull() -> Bool {
        return items.capacity == count
    }
    
    func size() -> Int {
        return count
    }
    
    func push(item: String) {
        if isFull() {
            assert(false, "Fixed capacity stack is full")
            return
        }
        items[count] = item
        count += 1
    }
    
    func pop() -> String? {
        if isEmpty() {
            return nil
        }
        count -= 1
        return items[count]
    }
}

extension FixedCapacityStackOfStrings: Sequence, IteratorProtocol {
    func next() -> String? {
        return ""
    }
}

extension FixedCapacityStackOfStrings {
    class func unitTest(_ args: String...) {
        let text = "it was - the best - of times - - - it was - the - -"
        let list = text.split(separator: " ")
        let stack = FixedCapacityStackOfStrings.init(capacity: list.count)
        for item in list {
            if item != "-" {
                stack.push(item: String(item))
            } else if (!stack.isEmpty()) {
                print(stack.pop() ?? "", separator: "", terminator: " ")
            }
        }
        print("(\(stack.size()) left on stack)")
    }
}
