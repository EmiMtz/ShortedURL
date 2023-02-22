//
//  NuAppTests.swift
//  NuAppTests
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import XCTest
@testable import NuApp

class MainModulePresenterTests: XCTestCase {
    typealias Sut = MainPresenter
    var sut: Sut!
    var view: MainViewMock!
    var interactor: MainInteractorMock!
    var router: MainRouterMockMock!
    
    override func setUp() {
        super.setUp()
        sut = MainPresenter()
        view = MainViewMock()
        router = MainRouterMockMock()
        interactor = MainInteractorMock()
        sut.view = view
        sut.interactor = interactor
        sut.router = router
    }
    
    override func tearDown() {
        sut = nil
        view = nil
        interactor = nil
        router = nil
        super.tearDown()
    }
    
    func testSentURL() {
        //Given
        let expectedResult: MainInteractorMockCalls = .sentURL
        
        //When
        sut.sentURL(text: "google.com")
        
        //Asserts
        XCTAssertTrue(interactor.calls.contains(expectedResult))
    }
    
    func testGetURL() {
        //Given
        let expectedResult: MainInteractorMockCalls = .getUrl
        
        //When
        sut.getURL(text: "1234")
        
        //Asserts
        XCTAssertTrue(interactor.calls.contains(expectedResult))
    }
    
    func testReceivedLinks() {
        //Given
        let links = ShortURL(alias: "1234", links: LinksModel(selfResponse: "123", short: "google.com"))
        let expectedResult = "1234"
        
        //When
        sut.onReceivedLinks(links)
        
        //Asserts
        XCTAssertEqual(expectedResult, view.calls["alias"] as? String)
    }
    
    func testOnReceivedCompleteLink() {
        //Given
        let link = ResponseLink(url: "google.com")
        let expectedResult = "google.com"
        
        //When
        sut.onReceivedCompleteLink(link)
        
        //Asserts
        XCTAssertEqual(expectedResult, view.calls["link"] as? String)
    }
    
}
