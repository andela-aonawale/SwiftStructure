//
//  LinkedList.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/12/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

protocol Linkable {
    typealias T
    var value: T { get set }
    var next: Self? { get set }
    var previous: Self? { get set }
    init(_ value: T)
}

final class Node<T>: Linkable {
    var value: T
    var next: Node?
    var previous: Node?
    required init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    
    typealias E = Node<T>
    
    private var head: E?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: E? {
        return head
    }
    
    var last: E? {
        var node = head
        while let next = node?.next {
            node = next
        }
        return node
    }
    
    func append(value: T) {
        let node = Node(value)
        guard let last = last else {
            head = node
            return
        }
        node.previous = last
        last.next = node
    }
    
    var count: Int {
        guard var node = head else { return 0 }
        var total = 1
        while let next = node.next {
            node = next
            ++total
        }
        return total
    }
    
    func nodeAtIndex(var index: Int) -> E? {
        guard index >= 0 else { return nil }
        var node = head
        while let current = node where index != 0 {
            --index
            node = current.next
        }
        return node
    }
    
    subscript(var index: Int) -> E {
        let node = nodeAtIndex(index)
        assert(node != nil)
        return node!
    }
    
    private func nodesBeforeAndAfter(var index: Int) -> (E?, E?) {
        assert(index >= 0)
        var next = head
        var prev: E?
        
        while let current = next where index != 0 {
            index -= 1
            prev = current
            next = current.next
        }
        assert(index == 0)
        
        return (prev, next)
    }
    
    func insert(value: T, atIndex index: Int) {
        let (prev, next) = nodesBeforeAndAfter(index)
        
        let node = Node(value)
        node.previous = prev
        node.next = next
        prev?.next = node
        next?.previous = node
        
        if prev == nil {
            head = node
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    func removeNode(node: E) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.next = nil
        node.previous = nil
        
        return node.value
    }
    
    func removeLast() -> T {
        assert(!isEmpty)
        return removeNode(last!)
    }
    
    func removeAtIndex(index: Int) -> T {
        let node = nodeAtIndex(index)
        assert(node != nil)
        return removeNode(node!)
    }
    
    func reverse() {
        var node = head
        while let currentNode = node {
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
            node = currentNode.previous
        }
    }
    
}

extension LinkedList {
    func map<U>(transform: T -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while let currentNode = node {
            result.append(transform(currentNode.value))
            node = currentNode.next
        }
        return result
    }
    func filter<U: BooleanType>(predicate: T -> U) -> LinkedList<T> {
        let result = LinkedList<T>()
        var node = head
        while let currentNode = node {
            if predicate(currentNode.value) {
                result.append(currentNode.value)
            }
            node = currentNode.next
        }
        return result
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}












