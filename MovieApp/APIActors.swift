//
//  APIActors.swift
//  MovieApp
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct APIActor: Codable , Identifiable{
    let id: Int
    let name:String
    let character :String
    let profilePath: String?
    //let imagePath: String
   
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case character 
        case profilePath = "profile_path"
    }
  
    
}



struct ActorsResult: Codable {
    let id: Int
    let cast: [APIActor]
}


struct ActorMovie: Identifiable{
    let id: Int
    let name:String
    let character :String
    let profilePath: String
    
    init(id: Int, name: String, character: String, profilePath: String?) {
        self.id = id
        self.name = name
        self.character = character
        self.profilePath = profilePath == nil ? "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pngarts.com%2Ffiles%2F10%2FDefault-Profile-Picture-Transparent-Image.png&f=1&nofb=1&ipt=7e8d0dac3eb550777dd7bc19decb373d2e85287f598981ae25a2e6d6ead2b10b&ipo=images" : "https://image.tmdb.org/t/p/original\(profilePath!)"
    }
    init(apiActor: APIActor){
        self.id = apiActor.id
        self.name = apiActor.name
        self.character = apiActor.character
        self.profilePath = apiActor.profilePath == nil ? "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pngarts.com%2Ffiles%2F10%2FDefault-Profile-Picture-Transparent-Image.png&f=1&nofb=1&ipt=7e8d0dac3eb550777dd7bc19decb373d2e85287f598981ae25a2e6d6ead2b10b&ipo=images" : "https://image.tmdb.org/t/p/original\(apiActor.profilePath!)"
    }
}
