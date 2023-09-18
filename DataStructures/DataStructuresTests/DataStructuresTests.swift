//
//  DataStructuresTests.swift
//  DataStructuresTests
//
//  Created by 이서준 on 2023/09/06.
//

import XCTest
@testable import DataStructures

class DataStructuresTests: XCTestCase {
    
    var sut: LinkedList<Int>!
    var sut2: DoublyLinkedList<Int>!
    var sut3: TowerOfHanoi!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
        sut2 = DoublyLinkedList<Int>()
        sut3 = TowerOfHanoi()
    }

    override func tearDownWithError() throws {
        sut = nil
        sut2 = nil
        sut3 = nil
        try super.tearDownWithError()
    }
    
    func testTowerOfHanoi() {
        let result = sut3.soulution(2)
        print(result)
    }
    
    func testDoublyLinkedList() {
        sut2.insert(data: 1)
        sut2.insert(data: 2)
        sut2.insert(data: 3)
        sut2.insert(data: 4)
        sut2.insert(data: 5)
        print(sut2.description)
        sut2.removeLast()
        sut2.removeLast()
        sut2.removeLast()
        sut2.removeLast()
        print(sut2.description)
    }

    /*
    func testLinkedListAbstractData() {
        sut.append(data: 1)
        sut.append(data: 2)
        print("\n==== testLinkedListAbstractData ====")
        print(sut.description)
        print("==== testLinkedListAbstractData ====\n")
        sut.removeLast()
        print(sut.description)
    }
    */

}
