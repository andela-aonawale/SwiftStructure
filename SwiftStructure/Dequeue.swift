//
//  Dequeue.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/15/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

struct Dequeue<T>: Queueable {
    var elements: [T] = []
    mutating func enqueueFront(element: T) {
        elements.insert(element, atIndex: 0)
    }
    mutating func dequeueBack() -> T? {
        return elements.removeLast()
    }
    func peekFront() -> T? {
        return elements.first
    }
    func peekBack() -> T? {
        return elements.last
    }
}