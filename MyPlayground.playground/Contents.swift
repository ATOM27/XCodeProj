//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class boo{
    var name: String
func hello() -> Bool{
    print(name)
    return true
}
    init (name: String){
        self.name = name
    }
    init (){
        name = "[Unnamed]"
    }
}

var bobo = boo()
bobo.hello()
