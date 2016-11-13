//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " World"

for i in newString.characters{
    print(i)
}

var newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)
newTypeString.substring(from: 6)
newTypeString.substring(with: NSRange(location: 3, length: 5))

if newTypeString.contains("orl"){
    print("Amin")
}

newTypeString.components(separatedBy: (" "))

newTypeString.uppercased