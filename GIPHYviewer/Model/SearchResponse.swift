//
//  SearchResponse.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 18/2/2021.
//

import Foundation

struct SearchResponse: Decodable {
    let data : [GIFItem]
    let pagination : Pagination
    let meta : Meta
}
