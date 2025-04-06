//
//  RepeatAgainTests.swift
//  RepeatAgainTests
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import XCTest
@testable import RepeatAgain

final class RepeatAgainTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailCorrect() {
        
        let email1 = EmailModel.emailValidate("Email@email.email")
        let email2 = EmailModel.emailValidate("good@good.ru")
        
        XCTAssertTrue(email2)
        XCTAssertFalse(email2)
        
    }

}
