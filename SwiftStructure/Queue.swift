//
//  Queue.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/9/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//
/*
A queue is a type of list where data are inserted at the end and are removed from the front. Queues are used to store data in the order in which they occur, as opposed to a stack, in which the last piece of data entered is the first element used for processing. Think of a queue like the line at your bank, where the first person into the line is the first person served, and as more customers enter a line, they wait in the back until it is their turn to be served.
A queue is an example of a first-in, first-out (FIFO) data structure. Queues are used to order processes submitted to an operating system or a print spooler, and simulation applications use queues to model scenarios such as customers standing in the line at a bank or a grocery store.
*/

import Foundation

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

struct Queue<T>: Queueable {
    var elements: [T] = []
}