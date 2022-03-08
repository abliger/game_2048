import XCTest
import class Foundation.Bundle
import commond

final class commondTests: XCTestCase {

    override func invokeTest() {
        Config.length = 4
        super.invokeTest()
    }

    func testMove() {
        let target: [[Int]] = [[2, 0, 0, 0], [2, 2, 0, 0], [2, 2, 2, 0], [2, 2, 2, 2], [0, 2, 2, 0], [0, 0, 2, 0], [0, 2, 0, 2], [0, 0, 0, 0], [0, 0, 0, 2], [0, 4, 0, 0], [0, 0, 16, 16], [2, 0, 0, 2], [4, 0, 2, 0], [0, 0, 4, 2]]
        let to: [[Int]] = [[2, 0, 0, 0], [2, 2, 0, 0], [2, 2, 2, 0], [2, 2, 2, 2], [2, 2, 0, 0], [2, 0, 0, 0], [2, 2, 0, 0], [0, 0, 0, 0], [2, 0, 0, 0], [4, 0, 0, 0], [16, 16, 0, 0], [2, 2, 0, 0], [4, 2, 0, 0], [4, 2, 0, 0]]
        for (i, var k) in target.enumerated() {
            move(&k)
            XCTAssertEqual(to[i], k)
        }
    }

    func testMerge() {
        let target: [[Int]] = [[2, 0, 0, 0], [2, 2, 0, 0], [2, 2, 2, 0], [2, 2, 2, 2], [0, 2, 2, 0], [0, 0, 2, 0], [0, 2, 0, 2], [0, 0, 0, 0], [0, 0, 0, 2], [0, 4, 0, 0], [0, 0, 16, 16], [2, 0, 0, 2], [4, 0, 2, 2], [2, 4, 2, 0], [2, 4, 0, 2], [2, 4, 2, 2], [2, 4, 2, 4, 2], [2, 4, 2, 4, 2, 2]]
        let to: [[Int]] = [[2, 0, 0, 0], [4, 0, 0, 0], [4, 0, 2, 0], [4, 0, 4, 0], [0, 4, 0, 0], [0, 0, 2, 0], [0, 4, 0, 0], [0, 0, 0, 0], [0, 0, 0, 2], [0, 4, 0, 0], [0, 0, 32, 0], [4, 0, 0, 0], [4, 0, 4, 0], [2, 4, 2, 0], [2, 4, 0, 2], [2, 4, 4, 0], [2, 4, 2, 4, 2], [2, 4, 2, 4, 4, 0]]
        for (i, var k) in target.enumerated() {
            merge(&k)
            XCTAssertEqual(to[i], k)
        }
    }

    func testRunable() {
        let target: [[Int]] = [[2, 0, 0, 0], [2, 2, 0, 0], [2, 2, 2, 0], [2, 2, 2, 2], [0, 2, 2, 0], [0, 0, 2, 0], [0, 2, 0, 2], [0, 0, 0, 0], [0, 0, 0, 2], [0, 4, 0, 0], [0, 0, 16, 16], [2, 0, 0, 2], [4, 0, 2, 2], [0, 2, 4, 2]]
        let toL: [[Int]] = [[2, 0, 0, 0], [4, 0, 0, 0], [4, 2, 0, 0], [4, 4, 0, 0], [4, 0, 0, 0], [2, 0, 0, 0], [4, 0, 0, 0], [0, 0, 0, 0], [2, 0, 0, 0], [4, 0, 0, 0], [32, 0, 0, 0], [4, 0, 0, 0], [4, 4, 0, 0], [2, 4, 2, 0]]
        let toLFlag: [Bool] = [false, true, true, true, true, true, true, false, true, true, true, true, true, true, true]
        let toRFlag: [Bool] = [true, true, true, true, true, true, true, false, false, true, true, true, true, false, false]
        for (i, var k) in target.enumerated() {
            XCTAssertEqual(toLFlag[i], runable(&k, .L))
            XCTAssertEqual(toL[i], k)
        }
        for (i, var k) in target.enumerated() {
            XCTAssertEqual(toRFlag[i], runable(&k, .R),  "\(i)")
            XCTAssertEqual(toL[i].reversed(), k)
        }
    }
}

