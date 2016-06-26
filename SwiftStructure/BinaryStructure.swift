//
//  BinaryStructure.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/26/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

protocol BinaryStructure {
    associatedtype T: Comparable
    var value: T { get set }
    var parent: Self? { get set }
    var left: Self? { get set }
    var right: Self? { get set }
    init(value: T)
}

extension BinaryStructure {
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isLeftChild: Bool {
        return parent?.left?.value == value
    }
    
    var isRightChild: Bool {
        return parent?.right?.value == value
    }
    
    var hasLeftChild: Bool {
        return left != nil
    }
    
    var hasRightChild: Bool {
        return right != nil
    }
    
    var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    func depth() -> Int {
        var node = self
        var edges = 0
        while case let parent? = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
}

extension BinaryStructure where Self: CustomStringConvertible {
    
    var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
    
}

extension BinaryStructure {
    
    func traverseInOrder(@noescape process: T -> Void) {
        left?.traverseInOrder(process)
        process(value)
        right?.traverseInOrder(process)
    }
    
    func traversePreOrder(@noescape process: T -> Void) {
        process(value)
        left?.traversePreOrder(process)
        right?.traversePreOrder(process)
    }
    
    func traversePostOrder(@noescape process: T -> Void) {
        left?.traversePostOrder(process)
        right?.traversePostOrder(process)
        process(value)
    }
    
    func map<U>(@noescape transform: T -> U) -> [U] {
        var array = [U]()
        if let left = left { array += left.map(transform) }
        array.append(transform(self.value))
        if let right = right { array += right.map(transform) }
        return array
    }
    
    func flatMap<U>(@noescape transform: T -> U?) -> [U] {
        var array = [U]()
        if let left = left { array += left.flatMap(transform) }
        if let value = transform(self.value) {
            array.append(value)
        }
        if let right = right { array += right.flatMap(transform) }
        return array
    }
    
    func filter(@noescape predicate: T -> Bool) -> [T] {
        var array = [T]()
        if let left = left { array += left.filter(predicate) }
        if  predicate(self.value) {
            array.append(self.value)
        }
        if let right = right { array += right.filter(predicate) }
        return array
    }
    
}