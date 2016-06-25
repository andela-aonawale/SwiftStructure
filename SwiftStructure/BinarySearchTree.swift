//
//  BinarySearchTree.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/24/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

protocol BinaryStructure {
    associatedtype T: Comparable
    var value: T { get }
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
    
}

protocol BinarySearchStructure: BinaryStructure, CustomStringConvertible {}

extension BinarySearchStructure {
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
    
    func search(value: T) -> Self? {
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        } else {
            return self
        }
    }
}

extension BinarySearchStructure {
    
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

final class BinarySearchTree<T: Comparable>: BinarySearchStructure {
    let value: T
    var parent: BinarySearchTree?
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        array.dropFirst().forEach { insert($0) }
    }
}

extension BinarySearchTree {
    func insert(value: T) {
        /*
         Because the whole point of a binary search tree is to have smaller nodes on the left and larger ones on the right, you should always insert elements at the root, to make to sure this remains a valid binary tree!
         */
        precondition(parent == nil, "You should always insert elements at the root.")
        insert(value, parent: self)
    }
    
    private func insert(newValue: T, parent: BinarySearchTree) {
        if newValue < self.value {
            if let left = left {
                left.insert(newValue, parent: left)
            } else {
                left = BinarySearchTree(value: newValue)
                left?.parent = parent
            }
        } else {
            if let right = right {
                right.insert(newValue, parent: right)
            } else {
                right = BinarySearchTree(value: newValue)
                right?.parent = parent
            }
        }
    }
    
    func toArray() -> [T] {
        return map { $0 }
    }
}



