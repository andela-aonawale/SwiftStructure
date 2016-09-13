//
//  InsertionSort.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 9/13/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation


func insertionSort<T>(array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var arr = array
    for i in 1..<arr.count {
        var j = i
        let temp = arr[j]
        while j > 0 && isOrderedBefore(temp, arr[j - 1]) {
            arr[j] = arr[j - 1]
            j -= 1
        }
        arr[j] = temp
    }
    return arr
}