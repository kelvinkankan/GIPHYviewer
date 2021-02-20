//
//  GIFViewModel2.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 19/2/2021.
//

import Foundation

class GIFViewModel2: ObservableObject {
    private let GIFService = OpenWebServiceController()
    @Published var GIFInfo : [GIFItem] = []
    
    init(){
        self.fetch()
    }
    
    func fetch (){
        GIFService.fetchGIFTrendingData() { (info, error) in
            guard error == nil else{
                print ("fail in GIFViewModel2")
                DispatchQueue.main.async {
                    self.GIFInfo = []
                }
                return
            }
            let GIFInfo = info
            DispatchQueue.main.async {
                self.GIFInfo = GIFInfo
            }
        }
    }
}
