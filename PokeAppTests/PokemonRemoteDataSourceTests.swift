//
//  PokeAppTests.swift
//  PokeAppTests
//
//  Created by Gus Adi on 02/04/24.
//

import Alamofire
import Mocker
import XCTest
@testable import PokeApp

final class PokemonRemoteDataSourceTests: XCTestCase {
    
    private var sut: PokemonMockRemoteDataSource?

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let session = Session(configuration: configuration)
        sut = PokemonMockRemoteDataSource(session: session)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_success_getPokemonList() async {
        let expectation = expectation(description: "success_getPokemonList")
        
        do {
            let result = try await sut?.getPokemons(on: 0)
            
            XCTAssertFalse((result ?? []).isEmpty)
            
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected Result : \(error)")
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }

    func test_fail_getPokemonList() async {
        let expectation = expectation(description: "fail_getPokemonList")
        
        do {
            let result = try await sut?.failGetPokemons(on: 0)
            
            XCTFail("Unexpected Result: \(result?.count ?? 0)")
        } catch {
            XCTAssertFalse(error.localizedDescription.isEmpty)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
    
    func test_success_getPokemonDetail() async {
        let expectation = expectation(description: "success_getPokemonDetail")
        
        do {
            let result = try await sut?.getDetail(from: "0")
            
            XCTAssertNotNil(result?.id)
            
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected Result : \(error)")
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
    
    func test_fail_getPokemonDetail() async {
        let expectation = expectation(description: "fail_getPokemonDetail")
        
        do {
            let result = try await sut?.failGetDetail(from: "0")
            
            XCTFail("Unexpected Result: \(result?.id ?? 0)")
        } catch {
            XCTAssertFalse(error.localizedDescription.isEmpty)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
    
    func test_success_getSpecies() async {
        let expectation = expectation(description: "success_getSpecies")
        
        do {
            let result = try await sut?.getSpecies(from: "0")
            
            XCTAssertNotNil(result?.id)
            
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected Result : \(error)")
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
    
    func test_fail_getSpecies() async {
        let expectation = expectation(description: "fail_getSpecies")
        
        do {
            let result = try await sut?.failGetSpecies(from: "0")
            
            XCTFail("Unexpected Result: \(result?.id ?? 0)")
        } catch {
            XCTAssertFalse(error.localizedDescription.isEmpty)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
    
    func test_success_getEvolution() async {
        let expectation = expectation(description: "success_getEvolution")
        
        do {
            let result = try await sut?.getEvolutions(with: "0")
            
            XCTAssertNotNil(result?.id)
            
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected Result : \(error)")
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
    
    func test_fail_getEvolution() async {
        let expectation = expectation(description: "fail_getEvolution")
        
        do {
            let result = try await sut?.failGetEvolutions(with: "0")
            
            XCTFail("Unexpected Result: \(result?.id ?? 0)")
        } catch {
            XCTAssertFalse(error.localizedDescription.isEmpty)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }
}
