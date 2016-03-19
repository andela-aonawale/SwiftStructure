//
//  Tree.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    var parent: TreeNode?
    var children: [TreeNode<T>] = []
    
    init(value: T) {
        self.value = value
    }
    
    func addChild(node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        var string = "\(value)"
        if !children.isEmpty {
            string += " {" + children.map { $0.description }.joinWithSeparator(", ") + "}"
        }
        return string
    }
}

extension TreeNode where T: Equatable {
    func search(value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            guard let found = child.search(value) else { continue }
            return found
        }
        return nil
    }
}