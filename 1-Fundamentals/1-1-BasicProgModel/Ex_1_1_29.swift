//
//  Ex_1_1_29.swift
//  Fundamental
//
//  Created by coze on 2018/10/14.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

class Ex_1_1_29 {
    
    class func unitTest(_ args: String...) {
        var whitelist = [7, 1, 5, 1, 9, 5, 7, 7, 5]
        whitelist = whitelist.sorted()
        let key = 7
        let i = rank(key, whitelist)
        let j = count(key, whitelist)
        print("The count less than key: \(i)")
        print("The count equals to key: \(j)")
        if j > 0 {
            print("The keys:")
            for k in i...(i+j-1) {
                print(whitelist[k], separator: "", terminator: " ")
            }
            print("")
        }
    }
    
    class func indexOf(_ key: Int, _ a: [Int]) -> Int {
        var lo = 0
        var hi = a.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if key < a[mid] {
                hi = mid - 1
            } else if (key > a[mid]) {
                lo = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
    
    class func rank(_ key: Int, _ a: [Int]) -> Int {
        var index = indexOf(key, a)
        while a[index] >= key {
            index -= 1
            if index < 0 {
                break
            }
        }
        if index <= 0 {
            return 0
        }
        index += 1
        return index
    }
    
    class func count(_ key: Int, _ a: [Int]) -> Int {
        var c = 0
        var i = rank(key, a)
        while i < a.count, a[i] == key {
            c += 1
            i += 1
        }
        return c
    }
    
}
