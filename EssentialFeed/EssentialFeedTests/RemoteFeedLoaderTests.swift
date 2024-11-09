//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arpana Rani on 09/11/24.
//

import XCTest

protocol HTTPClient {
    
 //   static var shared = HTTPClient()
  //  private init() {} -> As we changes let to var fro shared , we don't need this method
    
    //  Move the below comment code to a subclass as The same Http class is used in production , so we don not want set a property, just invoke a method
    /*
     var requestedURL: URL?
     func get(from url :String){
     requestedURL = URL(string: url)
     } */
    
    func get(from url :String)
    
}

class HTTPClientSpy : HTTPClient {
    
    var requestedURL: URL?
     func get(from url :String){
        requestedURL = URL(string: url)
    }
}

class RemoteFeedLoader{
    
    var client : HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load(){
      //  HTTPClient.shared.get(from: "https://www.apple.com") -> This way we are allocating space to memory
        //instaed of this we can inject the URL
        client.get(from: "https://www.apple.com")
    }
}
 class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
       // let client = HTTPClient.shared -> As Spy class created use that
       
        //  HTTPClient.shared = client ->  as we inject client as proper remove this line
        XCTAssertNil(client.requestedURL)
    }
     
     func test_init_load_RequestDataFromURL(){
         
         let client = HTTPClientSpy()
       //  HTTPClient.shared = client ->  as we inject client as proper remove this line
         let sut = RemoteFeedLoader(client: client)
         sut.load()
         XCTAssertNotNil(client.requestedURL)
     }
}
