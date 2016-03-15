//
//  Dequeue.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/15/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

protocol Deck: Queueable {
    
}

extension Deck {
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

struct Dequeue<T>: Deck {
    var elements: [T] = []
}