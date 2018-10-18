//
//  Ex_1_2_16.swift
//  Fundamental
//
//  Created by coze on 2018/10/18.
//  Copyright © 2018 cozelight. All rights reserved.
//

import Foundation

extension Rational {
    static func unitTest() {
        
        var x: Rational
        var y: Rational
        var z: Rational
        var r: Rational
        
        // 1/2 + 1/3 = 5/6
        x = Rational.init(1, 2)
        y = Rational.init(1, 3)
        r = Rational.init(5, 6)
        z = x.plus(y)
        assert(z == r, "1/2 + 1/3 = 5/6")
        
        // 1/9 + 8/9 = 1
        x = Rational.init(1, 9)
        y = Rational.init(8, 9)
        r = Rational.init(1, 1)
        z = x.plus(y)
        assert(z == r, "1/9 + 8/9 = 1")
        
        // 1/200000000 + 1/300000000 = 1/120000000
        x = Rational.init(1, 200000000)
        y = Rational.init(1, 300000000)
        r = Rational.init(1, 120000000)
        z = x.plus(y)
        assert(z == r, "1/200000000 + 1/300000000 = 1/120000000")
        
        // 1073741789/20 + 1073741789/30 = 1073741789/12
        x = Rational.init(1073741789, 20)
        y = Rational.init(1073741789, 30)
        r = Rational.init(1073741789, 12)
        z = x.plus(y)
        assert(z == r, "1073741789/20 + 1073741789/30 = 1073741789/12")
        
        //  4/17 * 17/4 = 1
        x = Rational.init(4, 17)
        y = Rational.init(17, 4)
        r = Rational.init(1, 1)
        z = x.times(y)
        assert(z == r, "4/17 * 17/4 = 1")
        
        // 3037141/3247033 * 3037547/3246599 = 841/961
        x = Rational.init(3037141, 3247033)
        y = Rational.init(3037547, 3246599)
        r = Rational.init(841, 961)
        z = x.times(y)
        assert(z == r, "3037141/3247033 * 3037547/3246599 = 841/961")
        
        // 1/6 - -4/-8 = -1/3
        x = Rational.init(1, 6)
        y = Rational.init(-4, -8)
        r = Rational.init(-1, 3)
        z = x.minus(y)
        assert(z == r, "1/6 - -4/-8 = -1/3")
        
        // 1 / 3/7 = 7/3
        x = Rational.init(1, 1)
        y = Rational.init(3, 7)
        r = Rational.init(7, 3)
        z = x.divides(y)
        assert(z == r, "1 / 3/7 = 7/3")
    }
}

struct Rational {
    
    private static let zero = Rational.init(0, 1)
    
    private var num: Int;
    private var den: Int;
    
    init(_ numerator: Int, _ denominator: Int) {
        guard denominator != 0 else {
            num = Int.max
            den = 1
            return
        }
        
        let g = Rational.gcd(numerator, denominator)
        num = numerator / g
        den = denominator / g
        
        if den < 0 {
            den = -den
            num = -num
        }
    }
    
    func numerator() -> Int {
        return num
    }
    
    func denominator() -> Int {
        return den
    }
    
    mutating func plus(_ that: Rational) -> Rational {
        if self == Rational.zero {
            return that
        }
        if that == Rational.zero {
            return self
        }
        
        let f = Rational.gcd(self.num, that.num)
        let g = Rational.gcd(self.den, that.den)
        
        // parentheses avoid overflow
        let numerator = (num/f) * (that.den/g) + (that.num/f) * (den/g)
        let denominator = den * (that.den/g)
        
        return Rational.init(numerator * f, denominator)
    }
    
    mutating func minus(_ that: Rational) -> Rational {
        return self.plus(that.negate());
    }
    
    mutating func times(_ that: Rational) -> Rational {
        let lhs = Rational.init(num, that.den)
        let rhs = Rational.init(that.num, den)
        return Rational.init(lhs.num * rhs.num, lhs.den * rhs.den)
    }
    
    mutating func divides(_ that: Rational) -> Rational {
        return self.times(that.reciprocal());
    }
    
    func toDouble() -> Double {
        return Double(num / den)
    }
    
    func toString() -> String {
        if den == 1 {
            return "\(num)"
        } else {
            return "\(num) / \(den)"
        }
    }
    
    func negate() -> Rational {
        return Rational.init(-num, den)
    }
    
    func abs() -> Rational {
        if num >= 0 {
            return self
        } else {
            return self.negate()
        }
    }
    
    func reciprocal() -> Rational {
        return Rational.init(den, num)
    }
    
    static func mediant(_ lhs: Rational, _ rhs: Rational) -> Rational {
        return Rational.init(lhs.num + rhs.num, lhs.den + rhs.den)
    }
    
    // MARK: Private
    private static func gcd(_ m: Int, _ n: Int) -> Int {
        var a = m
        var b = n
        if a < 0 {
            a = -a
        }
        if b < 0 {
            b = -b
        }
        if b == 0 {
            return a
        } else {
            return gcd(b, a % b)
        }
    }
    
}

extension Rational: Comparable {
    static func < (lhs: Rational, rhs: Rational) -> Bool {
        let num = lhs.num * rhs.den
        let den = lhs.den * rhs.num
        return num < den
    }
    
    static func == (lhs: Rational, rhs: Rational) -> Bool {
        let num = lhs.num * rhs.den
        let den = lhs.den * rhs.num
        return num == den
    }
}

extension Rational: Hashable {
    var hashValue: Int {
        return num.hashValue ^ den.hashValue
    }
}

extension Rational: CustomStringConvertible {
    var description: String {
        return self.toString()
    }
}
