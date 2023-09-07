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

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testLinkedListAbstractData() {
        sut.append(data: 1)
        sut.append(data: 2)
        print("\n==== testLinkedListAbstractData ====")
        print(sut.description)
        print("==== testLinkedListAbstractData ====\n")
        sut.removeLast()
        print(sut.description)
    }

}
