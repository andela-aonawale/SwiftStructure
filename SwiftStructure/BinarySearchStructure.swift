//
//  BinarySearchStructure.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/26/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

protocol BinarySearchStructure: BinaryStructure, CustomStringConvertible {}

extension BinarySearchStructure {
    
    func minimum() -> Self {
        var node = self
        while case let next? = node.left {
            node = next
        }
        return node
    }
    
    func maximum() -> Self {
        var node = self
        while case let next? = node.right {
            node = next
        }
        return node
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
    
    func successor() -> Self? {
        if let right = right {
            return right.minimum()
        } else {
            var node = self
            while case let parent? = node.parent {
                if parent.value > value { return parent }
                node = parent
            }
            return nil
        }
    }
    
    func predecessor() -> Self? {
        if let left = left {
            return left.maximum()
        } else {
            var node = self
            while case let parent? = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil
        }
    }
    
}