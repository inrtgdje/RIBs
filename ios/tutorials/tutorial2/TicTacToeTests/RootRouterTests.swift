//
//  RootRouterTests.swift
//  TicTacToeTests
//
//  Created by 汤天明 on 6/19/20.
//  Copyright © 2020 Uber. All rights reserved.
//
@testable import TicTacToe
import XCTest

class RootRouterTests: XCTestCase {

    
    private var loggedInbuilder:LoggedInBuildableMock!
    private var rootInteractor: RootInteractableMock!
    private var rootRouter: RootRouter!
    
    
    override func setUp() {
        super.setUp()
        loggedInbuilder = LoggedInBuildableMock()
        rootInteractor = RootInteractableMock()
        rootRouter = RootRouter(interactor: rootInteractor, viewController: RootViewControllableMock(), loggedOutBuilder: LoggedOutBuildableMock(), loggedInBuilder: loggedInbuilder)
        
    }
    
    func test_routeToLoggedIn_verifyInvokeBuilderAttachReturnedRouter(){
        
        let loggedInRouter = LoggedInRoutingMock(interactable: LoggedInInteractableMock())
        var assignedListener: LoggedInListener? = nil
        loggedInbuilder.buildHandler = {(_ listener: LoggedInListener) -> (LoggedInRouting) in
            assignedListener = listener
            return loggedInRouter
        }
        
        XCTAssertNil(assignedListener)
        XCTAssertEqual(loggedInbuilder.buildCallCount, 0)
        XCTAssertEqual(loggedInRouter.loadCallCount, 0)
        
        rootRouter.routeToLoggedIn(withPlayer1Name: "1", player2Name: "2")
        XCTAssertTrue(assignedListener === rootInteractor)
        XCTAssertEqual(loggedInbuilder.buildCallCount, 1)
        XCTAssertEqual(loggedInRouter.loadCallCount, 1)
        
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
