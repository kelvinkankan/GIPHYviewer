//
//  WebServiceController.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 18/2/2021.
//

import Foundation


public protocol WebServiceController {
 //   func fetchGIFData (for searchKey:String,  completionHandler: @escaping([GIFItem?], WebServiceControllerError?) -> Void)
    func fetchGIFData (for searchKey:String,  completionHandler: @escaping(String?, WebServiceControllerError?) -> Void)
     
    
}
    
