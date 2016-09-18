//
//  BinarySearch.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 9/18/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

func binarySearch<T: Comparable>(a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}