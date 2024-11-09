//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arpana Rani on 09/11/24.
//

import XCTest

class HTTPClient {
    
    static var shared = HTTPClient()
  //  private init() {} -> AS we changes let to var fro shared , we don't need this method
    
    //  Move the below comment code to a subclass as The same Http class is used in production , so we don not want set a property, just invoke a method
    /*
     var requestedURL: URL?
     func get(from url :String){
     requestedURL = URL(string: url)
     } */
    
    func get(from url :String){}
    
}

class HTTPClientSpy : HTTPClient {
    
    var requestedURL: URL?
    override func get(from url :String){
        requestedURL = URL(string: url)
    }
}

class RemoteFeedLoader{
    
    func load(){
        HTTPClient.shared.get(from: "https://www.apple.com")
    }
}
 class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        
        _ = RemoteFeedLoader()
       // let client = HTTPClient.shared -> As Spy class created use that
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        XCTAssertNil(client.requestedURL)
    }
     
     func test_init_load_RequestDataFromURL(){
         
         let client = HTTPClientSpy()
         HTTPClient.shared = client

         let sut = RemoteFeedLoader()
         sut.load()
         XCTAssertNotNil(client.requestedURL)
     }
}
