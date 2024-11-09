//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arpana Rani on 09/11/24.
//

import XCTest

class HTTPClient {
    
    static let shared = HTTPClient()
    private init() {}
     var requestedURL: URL?
}
class RemoteFeedLoader{
    
    func load(){
        HTTPClient.shared.requestedURL = URL("https://www.apple.com")
    }
}
 class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        
        _ = RemoteFeedLoader()
        let client = HTTPClient.shared
        XCTAssertNil(client.requestedURL)
    }
     
     func test_init_load_RequestDataFromURL(){
         
         let client = HTTPClient.shared
         let sut = RemoteFeedLoader()
         sut.load()
         XCTAssertNotNil(client.requestedURL)
     }
}
