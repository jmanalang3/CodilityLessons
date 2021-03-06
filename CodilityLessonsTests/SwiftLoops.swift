//
//  SwiftLoops.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 25.07.2019.
//

import XCTest

// Swift 4.2
class SwiftLoops: XCTestCase {
    
    static let numberOfElements = 1_000_000
    let numbers = Array(repeating: 1, count: numberOfElements)
    
    // ~0.250
    func testForIn() {
        measure {
            var sum = 0
            for number in numbers {
                sum += number
            }
            XCTAssertEqual(sum, SwiftLoops.numberOfElements)
        }
    }
    
    // ~0.498
    func testNumericRange() {
        measure {
            var sum = 0
            for index in 0..<numbers.count {
                sum += numbers[index]
            }
            XCTAssertEqual(sum, SwiftLoops.numberOfElements)
        }
    }
    
    // ~0.261
    func testForEach() {
        measure {
            var sum = 0
            numbers.forEach { number in
                sum += number
            }
            XCTAssertEqual(sum, SwiftLoops.numberOfElements)
        }
    }
    
    // ~0.125
    func testStride() {
        measure {
            var sum = 0
            for index in stride(from: numbers.count - 1, to: -1, by: -1) {
                sum += numbers[index]
            }
            XCTAssertEqual(sum, SwiftLoops.numberOfElements)
        }
    }
    
    // ~0.057
    func testWhile() {
        measure {
            var sum = 0
            var index = 0
            while index < numbers.count {
                sum += numbers[index]
                index += 1
            }
            XCTAssertEqual(sum, SwiftLoops.numberOfElements)
        }
    }
}
