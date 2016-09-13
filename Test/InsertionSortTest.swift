//
//  InsertionSortTest.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 9/13/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class InsertionSortTest: XCTestCase {
    
    func testSortNumbers() {
        let numbers = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
        let ascending = insertionSort(numbers, <)
        XCTAssertEqual(ascending, [-1, 0, 1, 2, 3, 3, 5, 8, 9, 10, 26, 27])
        let descending = insertionSort(numbers, >)
        XCTAssertEqual(descending, [27, 26, 10, 9, 8, 5, 3, 3, 2, 1, 0, -1])
    }
    
    func testSortStrings() {
        let strings = ["b", "a", "d", "c", "e", "l", "x"]
        let ascending = insertionSort(strings, <)
        XCTAssertEqual(ascending, ["a", "b", "c", "d", "e", "l", "x"])
        let descending = insertionSort(strings, >)
        XCTAssertEqual(descending, ["x", "l", "e", "d", "c", "b", "a"])
    }
    
    func testSortObjects() {
        struct Event {
            let priority: Int
        }
        let events = [109, -1, -33, 9, 2, 27, 8, 15, 1, 3, 0, 2006, 9273].map {
            return Event(priority: $0)
        }
        let ascending = insertionSort(events) { $0.priority < $1.priority }
        XCTAssertEqual(ascending.map { $0.priority }, [-33, -1, 0, 1, 2, 3, 8, 9, 15, 27, 109, 2006, 9273])
        let descending = insertionSort(events) { $0.priority > $1.priority }
        XCTAssertEqual(descending.map { $0.priority }, [9273, 2006, 109, 27, 15, 9, 8, 3, 2, 1, 0, -1, -33])
    }
    
}