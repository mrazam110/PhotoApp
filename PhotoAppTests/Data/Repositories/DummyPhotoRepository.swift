//
//  DummyPhotoRepository.swift
//  PhotoAppTests
//
//  Created by Muhammad Raza on 07/11/2022.
//

import XCTest
@testable import PhotoApp

final class MockDummyPhotoRepositoryTests: XCTestCase {
    
    let context = TestDependencies()
    
    func testDummyPhotoList() throws {
        let expectation = expectation(description: "DefaultDummyPhotoRepository's fetchPhotoList response should return success")
        
        let repository = DefaultDummyPhotoRepository(ctx: context)
        
        repository.fetchDummyPhotoList { result in
            switch result {
            case .success(let response):
                let dummyPhoto = response.first
                XCTAssertTrue(dummyPhoto?.id == 1, "DummyPhoto ID unmatched")
            case .failure(_):
                XCTAssertTrue(false, "This shouldn't response failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testDummyPhotoById() throws {
        let expectation = expectation(description: "DefaultDummyPhotoRepository's fetchPhotoById response should return success")
        
        let repository = DefaultDummyPhotoRepository(ctx: context)
        
        repository.fetchDummyPhoto(by: 1) { result in
            switch result {
            case .success(let response):
                let dummyPhoto = response
                XCTAssertTrue(dummyPhoto.albumId == 1, "DummyPhoto ID unmatched")
            case .failure(_):
                XCTAssertTrue(false, "This shouldn't response failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
}
