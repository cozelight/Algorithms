//
//  Ex_1_2_09.swift
//  Fundamental
//
//  Created by coze on 2018/10/18.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_2_09 {
    class func unitTest(_ args: String...) {
        let a = [1, 2, 3, 4, 6, 7, 8, 9, 12]
        let key = 1
        var counter = Counter.init("key")
        print(rank(key: key, a: a, counter: &counter))
        print(counter.toString())
    }
    
    class func rank(key: Int, a: [Int], counter: inout Counter) -> Int {
        return rank(key: key, a: a, lo: 0, hi: a.count - 1, counter: &counter)
    }
    
    class func rank(key: Int, a: [Int], lo: Int, hi: Int, counter: inout Counter) -> Int {
        if lo > hi {
            return -1
        }
        counter.increment()
        let mid = lo + (hi - lo) / 2
        if key < a[mid] {
            return rank(key: key, a: a, lo: lo, hi: mid - 1, counter: &counter)
        } else if key > a[mid] {
            return rank(key: key, a: a, lo: mid + 1, hi: hi, counter: &counter)
        } else {
            return mid
        }
    }
}

struct Counter {
    let name: String
    var count = 0
    init(_ name: String) {
        self.name = name
    }
    mutating func increment() {
        count += 1
    }
    func tally() -> Int {
        return count
    }
    func toString() -> String {
        return name + " count: \(count)"
    }
}
