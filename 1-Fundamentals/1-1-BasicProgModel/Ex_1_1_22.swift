//
//  Ex_1_1_22.swift
//  Fundamental
//
//  Created by coze on 2018/10/13.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_22 {
    class func unitTest(_ args: String...) {
        let a = [1, 2, 3, 4, 6, 7, 8, 9, 12]
        let key = 5
        let pos = rank(key, a)
        if pos == -1 {
            print("not found!")
        } else {
            print("position = \(pos)")
        }
    }
    
    class func rank(_ key: Int, _ a: [Int]) -> Int {
        return rank(key, a, 0, a.count - 1, 0)
    }
    
    class func rank(_ key: Int, _ a: [Int], _ lo: Int, _ hi: Int, _ depth: Int) -> Int {
        for _ in 0..<depth {
            print(" ", separator: "", terminator: "")
        }
        print("lo = \(lo), hi = \(hi), depth = \(depth)")
        if lo > hi {
            return -1
        }
        let mid = lo + (hi - lo) / 2
        if key < a[mid] {
            return rank(key, a, lo, mid - 1, depth + 1)
        } else if key > a[mid] {
            return rank(key, a, mid + 1, hi, depth + 1)
        } else {
            return mid
        }
    }
}
