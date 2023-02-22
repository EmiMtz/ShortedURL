//
//  InteractorTest.swift
//  NuAppTests
//
//  Created by Emiliano Alfredo Martinez Vazquez on 22/02/23.
//

import XCTest
@testable import NuApp

class InteractorTest: XCTestCase {
    typealias Sut = MainInteractor
    var sut: Sut!
    var remoteData: MainRemoteDataManagerMock!
    var presenter: MainInteractorMock!

    override func setUp() {
        super.setUp()
        sut = MainInteractor()
        remoteData = MainRemoteDataManagerMock()
        presenter = MainInteractorMock()
        sut.remoteData = remoteData
        sut.presenter = presenter
    }

    override func tearDown() {
        sut = nil
        remoteData = nil
        presenter = nil
        super.tearDown()
    }

    func testSentURL() {
        //Given
        let expectedResult: MainRemoteDataManagerMockCalls = .sentURL

        //When
        sut.sentURL(text: "google.com")

        //Asserts
        XCTAssertTrue(remoteData.calls.contains(expectedResult))
    }

    func testGetURL() {
        //Given
        let expectedResult: MainRemoteDataManagerMockCalls = .getURL

        //When
        sut.getURL(text: "1234")

        //Asserts
        XCTAssertTrue(remoteData.calls.contains(expectedResult))
    }
}
