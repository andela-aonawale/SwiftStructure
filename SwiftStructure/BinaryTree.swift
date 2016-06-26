//
//  BinaryTree.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/24/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

/*
 A general-purpose binary tree.
 
 Nodes don't have a reference to their parent.
 */

final class BinaryTree<T: Comparable>: BinaryStructure {
    var value: T
    var parent: BinaryTree?
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(value: T) {
        self.value = value
    }
}

extension BinaryTree: CustomStringConvertible {}