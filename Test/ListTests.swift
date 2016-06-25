//
//  ListTest.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/9/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class ListTest: XCTestCase {

    func testEmpty() {
        var list = List<Int>()
        XCTAssertEqual(list.length(), 0)
        XCTAssertEqual(list.currentPosition(), 0)
        XCTAssertFalse(list.moveTo(2))
        XCTAssertNil(list.getElement())
        XCTAssertEqual(list.find(4), nil)
        XCTAssertFalse(list.remove(8))
        XCTAssertFalse(list.contains(9))
    }
    
    func testMakeList() {
        var list = List<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        XCTAssertEqual(list.length(), 3)
        XCTAssertTrue(list.contains(3))
        XCTAssertEqual(list.getElement(), 1)
        XCTAssertNotNil(list.find(2))
    }
    
    func testRemoveElement() {
        var list = List<Int>()
        list.append(1)
        list.append(2)
        XCTAssertTrue(list.remove(1))
        XCTAssertEqual(list.length(), 1)
    }
    
    func testInsertAfter() {
        var list = List<Int>()
        list.append(1)
        list.append(2)
        XCTAssertTrue(list.insert(3, afterElement: 2))
        XCTAssertEqual(list.find(3), 2)
    }
    
}