//
//  HoroscopeProjectUITests.swift
//  HoroscopeProjectUITests
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import XCTest

class HoroscopeProjectUITests: XCTestCase {
    
    var app: XCUIApplication = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

        func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
            app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
           app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    
    func testWholeProgress(){
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.swipeUp()
        app.swipeDown()
        XCTAssert(app.tables.cells.count > 0)
        app.tables.cells.element(boundBy: 0).tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
//          func testWholeApp(){
//            XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
//            XCUIApplication().tables.element.cells.element(boundBy: 0).tap()
//
//    }
}

extension XCUIElement{
    func scrollToElement(element: XCUIElement){
        while !element.visible(){
            swipeUp()
        }
    }
    
    func visible() -> Bool{
        guard self.exists && !self.frame.isEmpty else{
            return false
        }
        
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}
