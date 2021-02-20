//
//  GIFItem.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 18/2/2021.
//

import Foundation


struct GIFItem: Codable, Identifiable, Hashable{
    let type : String
    let id : String
    let url : String
    let embed_url: String
    let title : String
    let rating : String
    let images : GIFImage
}

struct GIFImage: Codable, Hashable {
    let original : Original
}
struct Original: Codable, Hashable{
    let url: URL
}


