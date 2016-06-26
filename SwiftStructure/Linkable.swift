//
//  Linkable.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 6/26/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

protocol Linkable {
    associatedtype T
    var value: T { get set }
    var next: Self? { get set }
    var previous: Self? { get set }
    init(_ value: T)
}