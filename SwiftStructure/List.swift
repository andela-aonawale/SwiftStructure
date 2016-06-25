//
//  List.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/9/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

/*
Lists are especially useful if we don’t have to perform searches on the items in the list or put them into some type of sorted order. When we need to perform long searches or complex sorts, lists become less useful, especially with more complex data structures.
*/

import Foundation

protocol Listable {
    associatedtype T
    var position: Int { get set }
    var elements: [T] { get set }
    init(_ elements: T...)
}

extension Listable {
    mutating func append(element: T) {
        elements.append(element)
    }
    mutating func clear() {
        elements.removeAll()
        position = 0
    }
    func length() -> Int {
        return elements.count
    }
    mutating func front() {
        position = 0
    }
    mutating func end() {
        position = length() - 1
    }
    mutating func previous() {
        if position > 0 {
            position -= 1
        }
    }
    mutating func next() {
        if position < length() - 1 {
            position += 1
        }
    }
    func currentPosition() -> Int {
        return position
    }
    mutating func moveTo(position: Int) -> Bool {
        if position < length() {
            self.position = position
            return true
        }
        return false
    }
    func getElement() -> T? {
        return elements.count > 0 ? elements[position] : nil
    }
}

extension Listable where T: Equatable {
    func find(element: T) -> Int? {
        return elements.indexOf(element)
    }
    mutating func remove(element: T) -> Bool {
        guard let index = elements.indexOf(element) else { return false }
        elements.removeAtIndex(index)
        return true
    }
    mutating func insert(element: T, afterElement: T) -> Bool {
        guard let index = elements.indexOf(afterElement) else { return false }
        elements.insert(element, atIndex: index + 1)
        return true
    }
    func contains(element: T) -> Bool {
        return elements.indexOf(element) > -1
    }
}

extension Listable where T: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}

struct List<T>: Listable {
    var position = 0
    var elements: [T] = []
    init(_ elements: T...) {
        elements.forEach { append($0) }
    }
}