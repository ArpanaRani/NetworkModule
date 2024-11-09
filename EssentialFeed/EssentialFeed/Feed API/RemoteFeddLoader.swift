//
//  RemoteFeddLoader.swift
//  EssentialFeed
//
//  Created by Arpana Rani on 09/11/24.
//


public protocol HTTPClient {

    func get(from url :URL)
}

public class RemoteFeedLoader{
    
    var client : HTTPClient
    var url : URL
   public init(url :URL , client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
   public func load(){
      //  HTTPClient.shared.get(from: "https://www.apple.com") -> This way we are allocating space to memory
        //instaed of this we can inject the URL
        client.get(from: url)
    }
}
