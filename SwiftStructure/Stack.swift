//
//  Stack.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/9/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//
/*
A stack is a list of elements that are accessible only from one end of the list, which is called the top. One common, real-world example of a stack is the stack of trays at a cafeteria. Trays are always removed from the top, and when trays are put back on the stack after being washed, they are placed on the top of the stack. The stack is known as a last-in, first-out (LIFO) data structure.
*/

protocol Stackable {
    typealias T
    var elements: [T] { get set }
}

extension Stackable {
    var isEmpty: Bool { return elements.isEmpty }
    mutating func pop() -> T? {
        return isEmpty ? nil : elements.removeLast()
    }
    mutating func push(element: T) {
        elements.append(element)
    }
    func peek() -> T? {
        return elements.last
    }
    func length() -> Int {
        return elements.count
    }
}

extension Stackable where T: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}

struct Stack<T>: Stackable {
    var elements: [T] = []
}
