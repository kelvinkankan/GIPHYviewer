//
//  DisplayTredningGIF.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 19/2/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DisplayTredningGIF: View {
    @ObservedObject var favouriteList : FavouriteList
    @ObservedObject var gifViewModel2 : GIFViewModel2
    var body: some View {
        NavigationView {
            List(0..<gifViewModel2.GIFInfo.count){ item in
                
                NavigationLink(destination: TGIFDetailsView(favouriteList: favouriteList, gifViewModel2: gifViewModel2, item: item)) {
                    AnimatedImage(url: gifViewModel2.GIFInfo[item].images.original.url)
                        .resizable()
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 500, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: 300, alignment: .leading)
                        .scaledToFit()
                }
            }
            .navigationBarTitle("Trending GIF").accentColor(.green)
        }
    }
}

struct DisplayTredningGIF_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTredningGIF(favouriteList: FavouriteList(), gifViewModel2: GIFViewModel2())
    }
}
