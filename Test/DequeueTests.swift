//
//  DequeueTest.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/15/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class DequeueTest: QueueTest {
    func testEnqueueFront() {
        var queue = Dequeue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        queue.enqueueFront(789)
        XCTAssertEqual(queue.peekFront(), 789)
        XCTAssertEqual(queue.peekBack(), 456)
    }
    
    func testDequeueBack() {
        var queue = Dequeue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        queue.enqueue(789)
        XCTAssertEqual(queue.dequeueBack(), 789)
        XCTAssertEqual(queue.dequeueBack(), 456)
    }
}

