//
//  GIFViewModel.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 18/2/2021.
//

import Foundation

class GIFViewModel: ObservableObject {
    private let GIFService = OpenWebServiceController()
    @Published var GIFInfo : [GIFItem] = []
    
    func fetch (searchKey:String){
        GIFService.fetchGIFSearchingData(for: searchKey) { (info, error) in
            guard error == nil else{
                print ("fail in GIFViewModel1")
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
