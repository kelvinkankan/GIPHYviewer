//
//  DisplaySearchingGIF.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 19/2/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DisplaySearchingGIF: View {
    @ObservedObject var favouriteList : FavouriteList
    @ObservedObject var gifViewModel : GIFViewModel
    var searchKey : String
    var body: some View {
        NavigationView {
            List(0..<gifViewModel.GIFInfo.count){ item in
                
                NavigationLink(destination: SGIFDetailsView(favouriteList: favouriteList, gifViewModel: gifViewModel, item: item)) {
                    AnimatedImage(url: gifViewModel.GIFInfo[item].images.original.url)
                        .resizable()
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 500, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: 300, alignment: .leading)
                        .scaledToFit()
                    
               }
            }
            .navigationBarTitle("Search Result \"\(searchKey)\"")
        }
    }
}

struct DisplaySearchingGIF_Previews: PreviewProvider {
    static var previews: some View {
        DisplaySearchingGIF(favouriteList: FavouriteList(), gifViewModel: GIFViewModel(), searchKey: "test")
    }
}
