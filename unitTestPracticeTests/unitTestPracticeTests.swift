//
//  unitTestPracticeTests.swift
//  unitTestPracticeTests
//
//  Created by User on 2022/5/23.
//

import XCTest
@testable import unitTestPractice

/**
    單元測試主要三大方向:
        1. 測試沒有跟UI連動的
        2. 測試與UI連動的
        3. 測試非同步的api回傳狀態
 */

class unitTestPracticeTests: XCTestCase {
    
    var vc : ViewController!
    var urlSession: URLSession!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = ViewController()
        urlSession = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        urlSession = nil
    }
    
    // MARK: - 測試沒有與UI連動的
    
    func testPlusWithValue() {
        let a = 3
        let b = 2
        
        let result = vc.plus(a, b)
        
        XCTAssertEqual(result, 5, "Result is wrong")
    }
//
    func testPlusWithoutValue() {
        let a = 3

        let result = vc.plus(a, nil)

        XCTAssertNil(result, "Result is not nil")
    }

    // MARK: - 測試與UI連動的
    
    func testLabelText() {
        
        let text = "I'm Matthew"
        
        vc.changeWroding(text)
        
        XCTAssertEqual(text, vc.nameLabel.text)
    }
    
    // MARK: - 測試非同步的api回傳狀態
    func testAsynchronousAPI() {
            // Given
            var statusCode: Int?
            var responseError: Error?
            let url = URL(string: "https://www.google.com")
            let promise = expectation(description: "Invalid status code.") // 若是執行錯誤則會 log 出來的訊息
            
            // When
            let dataTask = urlSession.dataTask(with: url!) { data, response, error in
              statusCode = (response as? HTTPURLResponse)?.statusCode
              responseError = error
              promise.fulfill() // 表示非同步的任務已經結了，並告知 Wait() 可以結束了。表示可以繼續往下執行待驗證的數值。
            }
            
            dataTask.resume()
            wait(for: [promise], timeout: 8) // 設定被測試的 API 的 Timeout 時間
                    
            // Then
            XCTAssertNil(responseError, "Response is error.")
            XCTAssertEqual(statusCode, 200, "Invalid status code.")
        }
    
    func testLoopPerformance() {
        self.measure { //效能測試
            self.vc.loopSomething()
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
