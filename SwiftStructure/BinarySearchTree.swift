//
//  BinarySearchTree.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/24/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

final class BinarySearchTree<T: Comparable>: BinarySearchStructure {
    var value: T
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

extension BinarySearchTree {
    
    func reconnectParentToNode(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    func remove() {
        if let left = left {
            if let right = right {
                // This node has two children. It must be replaced by the smallest
                // child that is larger than this node's value, which is the leftmost
                // descendent of the right child.
                let successor = right.minimum()
                
                // Rather than deleting the current node (which is problematic for the
                // root node) we give it the successor's value and remove the successor.
                value = successor.value
                
                // If this in-order successor has a right child of its own (it cannot
                // have a left child by definition), then that must take its place.
                successor.remove()
            } else {
                // This node only has a left child. The left child replaces the node.
                reconnectParentToNode(left)
            }
        } else if let right = right {
            // This node only has a right child. The right child replaces the node.
            reconnectParentToNode(right)
        } else {
            // This node has no children. We just disconnect it from its parent.
            reconnectParentToNode(nil)
        }
    }
    
}