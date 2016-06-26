//
//  Queueable.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/26/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

protocol Queueable {
    associatedtype T
    var elements: [T] { get set }
}

extension Queueable {
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue() -> T? {
        return elements.count > 0 ? elements.removeFirst() : nil
    }
    func front() -> T? {
        return elements.first
    }
    func back() -> T? {
        return elements.last
    }
    func empty() -> Bool {
        return elements.isEmpty
    }
    func peek() -> T? {
        return elements.first
    }
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
}

extension Queueable where T: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}