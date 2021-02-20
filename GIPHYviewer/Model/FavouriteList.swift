//
//  FavouriteList.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 20/2/2021.
//

import Foundation

class FavouriteList : ObservableObject{
    @Published var idlist: [String] = []
    @Published var favlist: [GIFItem] = []
}

