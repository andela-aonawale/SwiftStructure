//
//  TreeTest.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 3/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class TreeTest: XCTestCase {
    var tree: TreeNode<String>!
    
    override func setUp() {
        super.setUp()
        tree = TreeNode<String>(value: "beverages")
    }
    
    func testEmptyTree() {
        XCTAssertNil(tree.parent)
        XCTAssertTrue(tree.children.isEmpty)
    }
    
    func testTreeChildren() {
        let hotNode = TreeNode<String>(value: "hot")
        let coldNode = TreeNode<String>(value: "cold")
        tree.addChild(hotNode)
        tree.addChild(coldNode)
        XCTAssertFalse(tree.children.isEmpty)
        XCTAssertEqual(tree.search("hot")?.value, hotNode.value)
        XCTAssertEqual(tree.search("cold")?.value, coldNode.value)
        XCTAssertNotNil(hotNode.parent)
        XCTAssertNotNil(coldNode.parent)
    }
    
    func testTreeNestedChildren() {
        let hotNode = TreeNode<String>(value: "hot")
        let coldNode = TreeNode<String>(value: "cold")
        
        let teaNode = TreeNode<String>(value: "tea")
        let coffeeNode = TreeNode<String>(value: "coffee")
        
        let blackTeaNode = TreeNode<String>(value: "black")
        let greenTeaNode = TreeNode<String>(value: "green")
        
        let sodaNode = TreeNode<String>(value: "soda")
        let milkNode = TreeNode<String>(value: "milk")
        
        tree.addChild(hotNode)
        tree.addChild(coldNode)
        
        hotNode.addChild(teaNode)
        hotNode.addChild(coffeeNode)
        
        coldNode.addChild(sodaNode)
        coldNode.addChild(milkNode)
        
        teaNode.addChild(blackTeaNode)
        teaNode.addChild(greenTeaNode)
        
        XCTAssertEqual(blackTeaNode.parent?.value, teaNode.value)
        XCTAssertEqual(milkNode.parent?.value, coldNode.value)
        XCTAssertNotNil(sodaNode.parent)
        XCTAssertNotNil(coffeeNode.parent)
    }
}