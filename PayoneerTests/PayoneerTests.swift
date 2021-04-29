//
//  PayoneerTests.swift
//  PayoneerTests
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import XCTest
@testable import Payoneer

class PayoneerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testPaymentWorker(){
        let worker = PaymentWorker()
        var list: PaymentList!
        var errorMessage: String!
        
        worker.getPaymentList { (paymentList) in
            list = paymentList
        } failure: { (error) in
            errorMessage = error
        }
        
         let exp = expectation(description: "Test after 2 seconds")
        
         let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
         if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(list)
            XCTAssertNil(errorMessage)
         } else {
            XCTFail("Delay interrupted")
         }
    
    }
    
    func testPaymentMethodsViewModel(){
        let model = PaymentMethodsViewModel()
        
        XCTAssertEqual(true, model.paymentOptions.value.isEmpty)
        XCTAssertEqual("", model.errorMessage.value)
        
        model.getPaymentList()
        
        let exp = expectation(description: "Test after 2 seconds")
       
        let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(false, model.paymentOptions.value.isEmpty)
            XCTAssertEqual("", model.errorMessage.value)
        } else {
           XCTFail("Delay interrupted")
        }
    }

}
