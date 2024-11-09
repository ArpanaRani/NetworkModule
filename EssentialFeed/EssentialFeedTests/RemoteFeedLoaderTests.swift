//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arpana Rani on 09/11/24.
//

import XCTest
@testable import EssentialFeed


 class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        let url = URL(string: "https://a-url.com")!

        let (_ , client) =  makeSUT()
        _ = RemoteFeedLoader(url: url, client: client)
       // let client = HTTPClient.shared -> As Spy class created use that
       
        //  HTTPClient.shared = client ->  as we inject client as proper remove this line
        XCTAssertNil(client.requestedURL)
    }
     
     func test_init_load_RequestDataFromURL(){
         let url = URL(string: "https://a-url.com")!
         let ( sut, client) = makeSUT(url:  url)
         sut.load()
         XCTAssertEqual(url , client.requestedURL)
     }
     
     private func makeSUT(url: URL = URL(string: "https://a-url.com")! ) -> (sut: RemoteFeedLoader , client: HTTPClientSpy){
         
         let client = HTTPClientSpy()
         let sut = RemoteFeedLoader(url: url, client: client)
         return(sut, client)
     }
     
     private class HTTPClientSpy : HTTPClient {
         
         var requestedURL: URL?
          func get(from url :URL){
             requestedURL =  url
         }
     }
}
