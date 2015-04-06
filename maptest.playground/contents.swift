//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import SwiftyJSON

var j = JSON("foo: { a: {bar: q}, {arr: f}]}")

struct SomeThing2 {
    let bar: String
    static func decode(j: JSON) -> SomeThing2 {
        return SomeThing2(bar: j["bar"].stringValue)
    }
}
struct SomeThing1 {
    let a: [String: SomeThing2]


    static func decode (j: JSON) -> SomeThing1 {
        return SomeThing(a: reduce(
            map( j["foo"].dictionaryValue,
                { return ($0, SomeThing2.decode($1)) }),
            [String: SomeThing2](),
            { $0[$1.0] = $1.1; return $0}
        )
    }
}



