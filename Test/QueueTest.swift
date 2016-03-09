//
//  QueueTest.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/9/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class QueueTest: XCTestCase {
    
    func testEmptyQueue() {
        var queue = Queue<Int>()
        XCTAssertNil(queue.dequeue())
        XCTAssertEqual(queue.peek(), nil)
    }
    
    func testOneElement() {
        var queue = Queue<Int>()
        queue.enqueue(123)
        XCTAssertNotNil(queue.peek())
        XCTAssertEqual(queue.dequeue(), 123)
        XCTAssertNil(queue.dequeue())
    }
    
    func testMakeElement() {
        var queue = Queue<Int>()
        queue.enqueue(123)
        queue.enqueue(456)
        queue.enqueue(789)
        XCTAssertEqual(queue.peek(), 123)
        XCTAssertNotNil(queue.dequeue())
        XCTAssertEqual(queue.dequeue(), 456)
        XCTAssertNotNil(queue.dequeue())
        XCTAssertNil(queue.peek())
    }
    
}
