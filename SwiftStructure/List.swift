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

struct List<T>: Listable {
    var position = 0
    var elements: [T] = []
    init(_ elements: T...) {
        elements.forEach { append($0) }
    }
}