//
//  OpenWebServiceController.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 18/2/2021.
//

import Foundation

public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

class OpenWebServiceController {
//    func fetchGIFData(for searchKey: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void) {
//    }
    
    
    func fetchGIFTrendingData(completionHandler: @escaping([GIFItem], WebServiceControllerError?) -> Void) {
//        let resourceURL : URL
        let limit : Int = 10
        let offset : Int = 0
        let API_Key: String = "sWf512dCmOXQwGnICvvfEPRjgpPJ3tcT"
        let rating : String = "g"
        
        let resouceString = "https://api.giphy.com/v1/gifs/trending?api_key=\(API_Key)&limit=\(limit)&offset=\(offset)&rating=\(rating)"
        
        guard let resourceURL = URL(string: resouceString) else {
            fatalError()
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                completionHandler([], WebServiceControllerError.forwarded(error!))
                return
            }
            guard let responseData = data else {
                completionHandler([], WebServiceControllerError.invalidPayload(resourceURL))
                return
            }
            
            //Decode Json
            let decoder = JSONDecoder()
            do{
                let ListGIF = try decoder.decode(SearchResponse.self, from: responseData)
                let gifInfo = ListGIF.data
                   
                    completionHandler(gifInfo, nil)
                } catch let error {
                completionHandler([], WebServiceControllerError.forwarded(error))
            }
//
        })
        
        dataTask.resume()
    }


    
    func fetchGIFSearchingData(for searchKey:String,  completionHandler: @escaping([GIFItem], WebServiceControllerError?) -> Void) {
//        let resourceURL : URL
        let limit : Int = 10
        let offset : Int = 0
        let API_Key: String = "sWf512dCmOXQwGnICvvfEPRjgpPJ3tcT"
        let rating : String = "g"
        
        let resouceString = "https://api.giphy.com/v1/gifs/search?api_key=\(API_Key)&q=\(searchKey)&limit=\(limit)&offset=\(offset)&rating=\(rating)"
        
        guard let resourceURL = URL(string: resouceString) else {
            fatalError()
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                completionHandler([], WebServiceControllerError.forwarded(error!))
                return
            }
            guard let responseData = data else {
                completionHandler([], WebServiceControllerError.invalidPayload(resourceURL))
                return
            }
            
            //Decode Json
            let decoder = JSONDecoder()
            do{
                let ListGIF = try decoder.decode(SearchResponse.self, from: responseData)
                let gifInfo = ListGIF.data
                      
                completionHandler(gifInfo, nil)
            } catch let error {
                completionHandler([], WebServiceControllerError.forwarded(error))
            }
            
        })
        
        dataTask.resume()
    }
}
