//
//  Stackable.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/26/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

protocol Stackable {
    associatedtype T
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